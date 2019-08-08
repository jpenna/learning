#include <iostream>
#include <stdio.h>
using namespace std;

int main() {
  // print
  cout << "\n\n---------------- Initializing ---------------\n" << std::endl;

  // type alias
  typedef int thisIsAlias;
  thisIsAlias x = 10;

  cout << x << "\n" << std::endl;

  // enum
  enum color {red, green, blue} colorA, colorB;
  colorA = green;
  colorB = blue;
  color colorC = red;

  printf("Colors enum: %i, %i, %i\n\n", colorA, colorB, colorC);

  // int
  int a = 0, b = 1, c = 3, d = 4;
  int e;
  cout << "Number: " << a;

  return 0;
}
