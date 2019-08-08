#include <iostream>
#include <string>
#include "Child.h"

using namespace std;

Child::Child() {
  cout << "Child constructor" << endl;
}
Child::~Child() {
  cout << "Child deconstructor" << endl;
}

void Child::sayIt() {
  cout << "Public var: " << publicv << endl;
  cout << "Protected var: " << protectedv << endl;
  // cout << "Private var: " << privatev << endl;
}

void Child::defineIt() {
  publicv = 10;
  protectedv = 11;
}
