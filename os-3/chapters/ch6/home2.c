#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main()
{
  int rc = fork();

  if (rc < 0)
  {
    fprintf(stderr, "Error forking\n");
  }

  if (rc == 0)
  {
    char *args[2];
    args[0] = strdup("1");
    args[1] = NULL;
    int res = execvp(args[0], args);

    if (res != 0)
    {
      printf("Error exec");
    }
  }
  else
  {
    printf("Parent exiting...\n");
  }

  return 0;
}
