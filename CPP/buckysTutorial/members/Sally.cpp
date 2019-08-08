#include <iostream>
#include "Sally.h"

using namespace std;

Sally::Sally(int constVar = 10) : constVar(constVar) {
  cout << "I am a constructor with only const param" << endl;
}

Sally::Sally(int a, int b, int c) : regVar(a), constVar(b) {
  cout << "I am a constructor" << endl;
  regVar2 = c;
}

void Sally::printVars() {
  cout << "Regular var is: " << regVar << ", and constVar is: " << constVar << endl;
}

// Destructor
Sally::~Sally() {
  cout << "I am the deconstructor" << endl;
}

void Sally::printCrap() {
  cout << "Did someone did?" << endl;
}

void Sally::printX() {
  cout << "print X" << endl;
}

void Sally::printX2() const {
  cout << "print X const" << endl;
}
