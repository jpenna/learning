#include <stdio.h>
#include <unistd.h>
#include <wait.h>
#include <stdlib.h> 
#include <string.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/mman.h>

int countDigits(int num) {
  int digits = 0;
  while (num >= 1) {
    num = num / 10;
    digits += 1; 
  }
  return digits;
}

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

  const int SIZE = 4096;
  const char* name = "collatz";
  char *ptr;

  // Shared Memory
  int shm_fd = shm_open(name, O_CREAT | O_RDWR, 0666);
  ftruncate(shm_fd, SIZE);
  ptr = (char*)mmap(0, SIZE, PROT_WRITE, MAP_SHARED, shm_fd, 0);

  pid_t pid = fork();

  if (pid < 0) {
    printf("Error forking process");
    return 2;
  } else if (pid == 0) {
    while (num != 1) {
      sprintf(ptr, "%d, ", num);
      ptr += countDigits(num) + 2;
      if (num % 2) num = 3 * num + 1;
      else num = num / 2;
    }
    sprintf(ptr, "1 \n");
  } else {
    wait(NULL);
    printf("%s", ptr);
    shm_unlink(name);
  }

  return 0;
}