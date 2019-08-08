#include <sys/types.h>
#include <wait.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
  pid_t pid;

  pid = fork();

  if (pid < 0) {
    fprintf(stderr, "Error forking");
    return 1;
  } else if (pid == 0) {
    execl("/bin/ls", "ls", NULL);
    printf("LINE J\n");
  } else {
    wait(NULL);
    printf("Child complete\n");
  }

  return 0;
}