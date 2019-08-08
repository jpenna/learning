#include <stdio.h>
#include <unistd.h>
#include <wait.h>
#include <stdlib.h> 
#include <string>

int main(int argc, char* argv[]) 
{
  if (argc > 2 || argc <= 1) {
    printf("Provide at least one number for parameter\n");
    return 1;
  }

  int num = atoi(argv[1]);

  if (num <= 0) {
    printf("Provide a positive number \n");
    return 1;
  }

  printf("Provided number: %d\n", num);

  pid_t pid = fork();

  if (pid < 0) {
    printf("Error forking process");
    return 2;
  } else if (pid == 0) {
    while (num != 1) {
      printf("%d", num);
      if (num % 2) num = 3 * num + 1;
      else num = num / 2;
      printf(", ");
    }
    printf("1 \n");
  } else {
    wait(NULL);
  }

  return 0;
}