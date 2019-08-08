#include <sys/types.h>
#include <wait.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
  pid_t pid, pid1;

  pid = fork();

  if (pid < 0) {
    fprintf(stderr, "Fork Failed");
    return 1;
  } else if (pid == 0) {
    pid1 = getpid();
    printf("child: pid = %d \n", pid); // 0
    printf("child: pid1 = %d \n", pid1); // child
  } else {
    printf("parent: pid = %d \n", pid); // child
    printf("parent: pid1 = %d \n", pid1); // 0 - empty is 0
    wait(NULL);
  }

  return 0;
}