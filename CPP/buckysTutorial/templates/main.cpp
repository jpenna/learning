#include <iostream>
#include "specialization.cpp"

using namespace std;

template <class T>
T addSomething(T x, T y) {
  cout << "x: " << x << endl;
  cout << "y: " << y << endl;
  return x + y;
}

template <class FIRST, class SECOND>
FIRST smaller(FIRST a, SECOND b) {
  return a < b ? a : b;
}

template <class T, class U>
class Compare {
  T x;
  U y;
  public:
    Compare(T a, U b) {
      x = a;
      y = b;
    }
    T bigger();
};

template <class T, class U>
T Compare<T, U>::bigger() {
  return x > y ? x : y;
}

int main() {
  double x = 10.9, y = 9.123, sum;
  cout << "x main: " << x << endl;
  cout << "y main: " << y << endl;

  sum = addSomething(x, y);
  cout << sum << endl;

  int a = 891.1234;
  double b = 123123;
  cout << "Smaller of them: " << smaller(a, b) << endl;

  Compare <double, double> compare(10.89, 8.123);
  cout << compare.bigger() << endl;

  specialization();
}
