#include <iostream>

using namespace std;

int *q;
int x;

int main() {
  int *p;
  int y;
  cout << "p: " << p << endl;
  cout << "q: " << q << endl;
  cout << "x: " << x << endl;
  cout << "y: " << y << endl;

  p = new int;

  cout << p << endl;

  *p = 90;
  cout << "p: " << p << endl;
  cout << "p: " << *p << endl;

  delete p;

  cout << "delete p: " << p << endl;
  cout << "delete p: " << *p << endl;

  p = 0;
  cout << "p = 0: " << p << endl;
  // cout << "p = 0: " << *p << endl;
}
