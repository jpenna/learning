#include <iostream>

using namespace std;

double f(double x) {
  return x + 10;
}

double sum(double func(double), int start, int end) {
  double sum;
  for (int i = start; i <= end; i++) {
    sum += func(i);
  }
  return sum;
}

main() {
  cout << "Function f: " << f << endl;
  cout << "Function *f: " << *f << endl;

  double x = sum(f, 1, 4);
  cout << "Result: " << x << endl;
}
