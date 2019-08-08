#include <iostream>
#include "Mother.h"

using namespace std;

Mother::Mother() {
  cout << "Mother constructor" << endl;
}
Mother::~Mother() {
  cout << "Mother deconstructor" << endl;
}

void Mother::sayName() {
  cout << "I am Nana!" << endl;
}
