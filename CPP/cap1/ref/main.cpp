#include <iostream>

using namespace std;

void references();
void refFunctions();

int main() {
  class C {
    public:
      C(int x) : n(x) {};
      int& returnRef() {
        return n;
      };
      int getN() {
        return n;
      };
    private:
      int n;
  } c(1);

  cout << "getN: " << c.getN() << endl;
  cout << "returnRef: " << c.returnRef() << endl;

  int& ref = c.returnRef();
  ref = 999;

  cout << "getN after change: " << c.getN() << endl;
}

// References
void references() {
  int n = 5;
  int *p = &n;
  int &r = *p; // r is an alias to n
  int *const c = p; // same as above (r is a constant pointer)

  cout << "n address: " << &n << endl;
  cout << "n value: " << n << endl;

  cout << "\np address: " << &p << endl;
  cout << "p point to address: " << p << endl;
  cout << "p point to value: " << *p << endl;

  cout << "\nr address: " << &r << endl;
  cout << "r point to address: " << r << endl;

  p = &n + 1;

  cout << "\np address: " << &p << endl;
  cout << "p point to address: " << p << endl;
  cout << "p point to value: " << *p << endl;
}

// Reference with function
void f1(int i, int* p, int& r) {
  i = 2;
  *p = 3;
  r = 4;
}

int& returnRef(int array[], int pos) {
  return array[pos];
}
int* returnPointer(int array[], int pos) {
  return &array[pos];
}

void refFunctions() {
  int x = 40;
  int y = 41;
  int z = 42;

  f1(x, &y, z);

  cout << "x: " << x << endl;
  cout << "y: " << y << endl;
  cout << "z: " << z << endl << endl;

  int a[] = {1,2,3,4,5};

  int &ref = returnRef(a, 3);
  cout << "ref: " << ref << endl;
  returnRef(a, 3) = 10;
  cout << "ref: " << ref << endl << endl;

  int *pointer = returnPointer(a, 2);
  cout << "pointer: " << *pointer << endl;
  *returnPointer(a, 2) = 8;
  cout << "pointer: " << *pointer << endl << endl;
}
