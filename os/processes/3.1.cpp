#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int value = 5;

int main()
{
  pid_t pid;

  pid = fork();

  if (pid == 0) { // child
    value += 15;
    printf("CHILD: value = %d \n", value);
    return 0;
  } 
  else if (pid > 0) { // parent
    wait(NULL);
    printf("PARENT: value = %d \n", value);
    return 0;
  }
}