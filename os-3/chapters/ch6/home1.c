#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[])
{
  int value = 100;

  int rc = fork();

  // close(STDOUT_FILENO);
  FILE *fd = fopen("./home1.log", "a+");

  // If nothing to wait, returns -1
  pid_t ops = wait(NULL);
  value = 90;
  printf("Out Wait: %d\n", ops);

  if (rc < 0)
  {
    fprintf(stderr, "Error forking");
    exit(1);
  }

  if (rc == 0)
  {
    pid_t ch = wait(NULL);
    value = 70;
    printf("Child PID: %d\n", getpid());
    printf("Wait Child PID: %d\n", ch);
    fprintf(fd, "CHILD value: %d\n", value);
  }
  else
  {
    int status;
    pid_t w = waitpid(rc, &status, WNOHANG);
    value = 90;
    printf("PARENT value: %d\nWait: %d. Status: %d\n", value, (int)w, status);
  }

  return 0;
}
