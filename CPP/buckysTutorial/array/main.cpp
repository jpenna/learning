#include <iostream>

using namespace std;

void passByValue(int x) {
  x = 99;
}

void passByReference(int *x) {
  *x = 99;
}

int main() {
  int x = 5;
  cout << x << endl;
  cout << &x << endl;

  int* xPointer = &x;

  cout << *xPointer << endl;

  int num = 5;
  int num2 = 7;

  passByValue(num);
  passByReference(&num2);

  cout << "Passed by value: " << num << endl;
  cout << "Passed by reference: " << num2 << endl;

  cout << endl;

  char c;
  int i;
  float f;
  double d;
  int empty[5];
  int array[5] = {123, 125, 9098192, 1235, 123897123};

  cout << "Size of char: " << sizeof(c) << endl;
  cout << "Size of int: " << sizeof(i) << endl;
  cout << "Size of float: " << sizeof(f) << endl;
  cout << "Size of double: " << sizeof(d) << endl;
  cout << "Size of a empty array: " << sizeof(empty) << endl;
  cout << "Size of a array: " << sizeof(array) << endl;

  cout << endl;
  cout << "How many element in empty array? " << sizeof(empty) / sizeof(empty[0]) << endl;
  cout << "How many element in array? " << sizeof(array) / sizeof(array[0]) << endl;
}
