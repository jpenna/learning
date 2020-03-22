#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  int rc = fork();

  if (rc == 0)
  {
    // close(STDOUT_FILENO);
    int cpid = getpid();
    printf("Child 1 PID: %d\n", cpid);

    int fk = fork();

    if (fk == 0)
    {
      int pid = getpid();
      char mypid[6];
      sprintf(mypid, "%d", cpid);

      char fds[30];
      // This doesn't work to see the open file descriptors
      strcat(fds, "ls ");
      strcat(fds, "/proc/");
      strcat(fds, mypid);
      strcat(fds, "/fd/");

      printf("Path: %s\n", fds);

      execlp(fds, "");
    }
    else
    {
      printf("Hello child\n");
    }
  }

  return 0;
}
