#include <iostream>
#include "People.h"
#include "Birthday.h"

using namespace std;

int main() {
  Birthday birth(3, 21, 1991);
  People person("Juliano", birth);

  person.printInfo();
}
