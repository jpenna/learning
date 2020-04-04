#include <stdlib.h>
#include <stdio.h>

// Should use gdb and valgrind, but they don't work and I don't want to spend time on it..

int main(int argc, char *argv[])
{
  int *ptr = (int *) calloc(10 * sizeof(int), sizeof(int));
  ptr[90] = 68;

  printf("val 1: %d\n", ptr[90]);
  printf("%p: %d\n", ptr, *ptr);

  int *ptr2 = &ptr[90];

  printf("\nval 1.1: %p\n", &*ptr2);
  printf("%p: %d\n", ptr2, *ptr2);

  // free(ptr);

  ptr = (int *)calloc(100 * sizeof(int), sizeof(int));

  for (int i = 0; i < 100; i++) {
    ptr[i] = 10;
  }

  printf("\nval 2: %d\n", ptr[90]);
  printf("%p: %d\n", ptr, *ptr);

  printf("\nval 1.1: %p\n", &ptr2);
  printf("%p: %d\n", ptr2, *ptr2);
}
