#include <iostream>

using namespace std;

void swap(int& a, int& b) {
  int temp = a;
  a = b;
  b = temp;
}
void swapConst(const int& a, const int& b) {
  int temp = a;
  // cant swap, but can pass const params
  // a = b;
  // b = temp;
}

void change(int& a) {
  a = 1;
}

main(int argc, char const *argv[])
{
  // int& ref = 5; // Doesn't work
  const int& ref = 5;

  cout << "\ninit" << endl;
  int x = 10, y = 20; // Cannot change variable of reference
  int& xRef = x, &yRef = y; // the * or & is based on variable, not the type (&yRef)
  cout << "X: " << x << endl;
  xRef = yRef;
  cout << "X: " << x << endl;
  cout << "Y: " << y << endl;

  cout << "\nnotRef" << endl;
  int& notRef = xRef;
  notRef = 50;
  cout << "X: " << x << endl;

  cout << "\nswap()" << endl;
  swap(x, y);
  cout << "X: " << x << endl;
  cout << "Y: " << yRef << endl;
  swapConst(9, 10);

  cout << "\npointers" << endl;
  int *h = &x, *j = &y;
  swap(*h, *j);
  cout << "X: " << x << endl;
  cout << "Y: " << y << endl;

  cout << "\n safety" << endl;
  int* p = (int*)8;
  // cout << *p << endl; // Segmentation fault
  // change(*p);
}
