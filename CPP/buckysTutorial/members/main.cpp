#include <iostream>
#include "Sally.h"

using namespace std;

int main() {
  Sally sallyObject(3, 87, 10);
  Sally *sallyPointer = &sallyObject;

  sallyObject.printVars();

  sallyObject.printCrap();

  sallyPointer->printCrap();

  sallyPointer->printX();

  const Sally constObj(9);
  constObj.printX2();

}
