#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
  printf("hello world (pid: %d)\n", (int)getpid());
  int f = fork();

  if (f < 0)
  {
    fprintf(stderr, "Problem");
    exit(1);
  }

  if (f == 0)
  {
    printf("Child process (PID: %d)\n", (int)getpid());

    // Redirect to a file
    close(STDOUT_FILENO);
    open("./p4.output", O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU);

    char *myArgs[3];
    myArgs[0] = strdup("wc");
    myArgs[1] = strdup("./my1.c");
    myArgs[2] = NULL;
    execvp(myArgs[0], myArgs);
    printf("Should not print this line");
  }
  else
  {
    int rc_wait = wait(NULL);
    printf("Parent process (PID: %d). Child: %d\n", (int)getpid(), f);
  }

  return 0;
}
