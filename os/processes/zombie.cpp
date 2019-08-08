#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>


int main()
{
  pid_t pid;

  pid = fork();


  if (pid == 0) {
    printf("End child\n");
  } else {
    sleep(30);
    printf("End parent. %d\n", pid);
  }

  return 0;
}