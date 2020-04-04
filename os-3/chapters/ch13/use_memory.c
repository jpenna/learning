#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>

int main (int argc, char* argv[])
{
  printf("%d\n", getpid());

  // if (argc < 3)
  if (argc < 2)
  {
    // printf("Usage: `use_memory [items] [loops]`");
    printf("Usage: `use_memory [items]`");
  }

  int items = atoi(argv[1]);
  // int loops = atoi(argv[2]);

  int* ptr = (int*) malloc(items * sizeof(int));
  int* init = ptr;

  printf("This will use: %f MB\n", ((sizeof(int) * items) / pow(2, 20)));

  if (ptr == NULL)
  {
    printf("There was a problem allocating items.\n");
    exit(0);
  }

  int* last = ptr + items;

  // for (int i = 0; i < loops; i++)
  while (ptr)
  {
    // printf("%p: %d\n", &*ptr, *ptr);
    ptr = ptr + 1;

    if (ptr == last)
    {
      printf("Reset\n");
      ptr = init;
      sleep(10);
    }

    *ptr = 1;

    // usleep(3000);
  }

  free(init);

  return 0;
}
