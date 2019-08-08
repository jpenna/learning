#include <stdio.h>
#include <unistd.h>

int main()
{
  printf("Main\n");
  // fork a child process
  fork(); // 2
  printf("Child 1\n");

  fork(); // 4
  printf("Child 2\n");

  fork(); // 8
  printf("Child 3\n");

  return 0;
}