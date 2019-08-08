#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void main(int argc, char *argv[]) {
  FILE *fptr1, *fptr2;
  char filename[100], c, answer;

  if (argc > 1) {
    strcpy(filename, argv[1]);
  } else {
    printf("Enter filename to copy from: ");
    scanf("%s", filename);
  }

  fptr1 = fopen(filename, "r");
  if (fptr1 == NULL) {
    printf("The file \"%s\" was not found\n", filename);
    exit(1);
  }

  if (argc > 2) strcpy(filename, argv[2]);
  else {
    printf("Enter filename for writting: ");
    scanf("%s", filename);
  }

  if (access(filename, F_OK) != -1) {
    printf("This file already exists. Do you want to replace it (y/n)? ");
    scanf(" %c", &answer);

    if (answer != 'y') {
      printf("Input: \"%c\". Exiting...\n", answer);
      exit(1);
    }
  }

  fptr2 = fopen(filename, "w");
  if (filename == NULL) {
    printf("Couldn't create/replace \"filename\".\n", filename);
    exit(1);
  }

  while ((c = fgetc(fptr1)) != EOF) {
    fputc(c, fptr2);
  }

  printf("Contents copied to \"%s\".\n", filename);

  fclose(fptr1);
  fclose(fptr2);

  exit(0);
}
