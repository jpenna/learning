#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>
#include <string.h>

void calc(FILE *fd, char doPrint) {
  char buffer[30];
  struct timeval tv;
  time_t before, after;

  gettimeofday(&tv, NULL);
  before = tv.tv_sec;
  printf("Before: %ld\n", before);

  for (int i = 0; i < 9999999; i++)
  {
    if (doPrint) fprintf(fd, "%d", i);
  }

  gettimeofday(&tv, NULL);
  after = tv.tv_sec;

  printf("After: %ld\n", after);

  long diff = after - before;

  printf("Diff: %ld\n************\n", diff);
}

int main(int argc, char *argv[])
{
  void (*proc)(FILE *fd, char doPrint);

  FILE *fd = fopen("./home1.log", "a+");

  proc = calc;

  proc(fd, 1);

  proc(fd, 0);

  return 0;
};
