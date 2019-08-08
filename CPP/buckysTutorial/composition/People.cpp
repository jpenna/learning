#include <iostream>
#include <string>
#include "People.h"
#include "Birthday.h"

using namespace std;

People::People(string n, Birthday birth) : name(n), dateOfBirth(birth) {
}

void People::printInfo() {
  cout << name << " was born in ";
  dateOfBirth.printDate();
}
