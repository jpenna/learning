#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>
#include <string.h>

int main(int argc, char *argv[])
{
  int pipe1_fd[2];
  int pipe2_fd[2];

  pipe(pipe1_fd);
  pipe(pipe2_fd);

  char buffer1[30];
  char buffer2[30];

  int count = 0;
  int limit = 1000000;

  struct timeval tv;
  time_t before, after;

  gettimeofday(&tv, NULL);
  before = tv.tv_sec * 1e6 + tv.tv_usec;

  int rc = fork();

  if (rc < 0)
  {
    fprintf(stderr, "Error forking");
    exit(1);
  }

  if (rc == 0)
  {
    close(pipe2_fd[0]);
    close(pipe1_fd[1]);
    char str[8] = "child";
    printf("child start\n");
    while (read(pipe1_fd[0], &buffer1, 30) > 0)
    {
      // printf("%d\n", count);
      // sleep(1);
      count += 1;
      // printf("%s\n", buffer1);
      memset(buffer1, 0, sizeof buffer1);
      write(pipe2_fd[1], str, strlen(str));

      if (count > limit)
      {
        break;
      }
    }
  }
  else
  {
    close(pipe1_fd[0]);
    close(pipe2_fd[1]);
    char str[8] = "parent";
    write(pipe1_fd[1], str, strlen(str));
    printf("parent start\n");
    while (read(pipe2_fd[0], &buffer2, 30) > 0)
    {
      // printf("%d\n", count);
      // sleep(1);
      count += 1;
      // printf("%s\n", buffer2);
      memset(buffer2, 0, sizeof buffer2);
      write(pipe1_fd[1], str, strlen(str));

      if (count > limit)
      {
        gettimeofday(&tv, NULL);
        after = tv.tv_sec * 1e6 + tv.tv_usec;
        double elapsed = (double)(after - before) / 1e6;
        long loops = limit * 2;
        printf("Elapsed: %f\n", elapsed);
        printf("per loop: %f seconds (%f microseconds)\n", elapsed / loops, elapsed / loops * 1e3);


        break;
      }
    }
  }

  return 0;
}
