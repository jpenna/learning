#include <iostream>

using namespace std;

struct Employee {
  char firstLetter;
  char lastLetter;
  unsigned int salary;
  unsigned int number;

  void print(int x = 0) {
    if (x == 1) {
      cout << "Nah nah" << endl;
    } else if (x == 3) {
      cout << firstLetter << lastLetter << endl;
    } else {
      cout
        << number
        << ' ' << firstLetter
        << lastLetter
        << ' ' << salary
        << endl;
    }
  }
};

void someFunction(void) {
  cout << "Called function: " << __func__ << endl;
  cout << "Void" << endl;
}

void someFunction(int x, int y) {
  cout << "x: " << x << endl;
  cout << "y: " << y << endl;
}
