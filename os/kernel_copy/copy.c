#include <fcntl.h>
#include <unistd.h>
#if defined(__APPLE__) || defined(__FreeBSD__)
#include <copyfile.h>
#else
#include <sys/sendfile.h>
#endif
#include <sys/stat.h>

int OSCopyFile(const char* source, const char* destination)
{
    int input, output;
    if ((input = open(source, O_RDONLY)) == -1)
    {
        return -1;
    }
    if ((output = creat(destination, 0660)) == -1)
    {
        close(input);
        return -1;
    }

    //Here we use kernel-space copying for performance reasons
    #if defined(__APPLE__) || defined(__FreeBSD__)
    //fcopyfile works on FreeBSD and OS X 10.5+
    int result = fcopyfile(input, output, 0, COPYFILE_ALL);
    #else
    //sendfile will work with non-socket output (i.e. regular file) on Linux 2.6.33+
    off_t bytesCopied = 0;
    struct stat fileinfo = {0};
    fstat(input, &fileinfo);
    int result = sendfile(output, input, &bytesCopied, fileinfo.st_size);
    #endif

    close(input);
    close(output);

    return result;
}

void main(int argc, char* argv[]) {
  OSCopyFile(argv[1], argv[2]);
}
