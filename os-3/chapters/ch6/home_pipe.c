#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main()
{
  int pipe_fd[2];
  pipe(pipe_fd);

  pid_t rc_1 = fork();

  // printf("%d - %d\n", pipe_fd[0], pipe_fd[1]);

  if (rc_1 == 0)
  {
    char str[30] = "My name is John.\n";

    pid_t rc_2 = fork();

    if (rc_2 == 0)
    {
      close(pipe_fd[1]);
      char buf;

      while (read(pipe_fd[0], &buf, 1) > 0)
      {
        // printf("read: %d\n", (int)read(pipe_fd[0], &buf, 1));
        write(STDOUT_FILENO, &buf, 1);
      }

      // write(STDOUT_FILENO, "\n", 1);
      close(pipe_fd[0]);
      printf("child 2\n");
    }
    else
    {
      // char str[30] = "My name is Mary.\n";
      close(pipe_fd[0]);
      write(pipe_fd[1], str, strlen(str));
      printf("child\n");
    }
  }
  else
  {
    // wait(NULL);
    // wait(NULL);
    char str[30] = "My name is Peter.\n";
    close(pipe_fd[0]);
    write(pipe_fd[1], str, strlen(str));
    printf("parent\n");
  }
}
