#include <unistd.h>
#include <stdio.h>

int main()
{
  int i;
  int n = 0;

  for (i = 0; i < 4; i++) {
    n++;
    fork();
    printf("Fork %d \n", n);
  }

  printf("Process \n");
}