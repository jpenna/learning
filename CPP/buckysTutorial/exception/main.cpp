#include <iostream>

using namespace std;

int main() {
  try {
    int mothersAge = 30;
    int sonsAge = 35;

    if (sonsAge > mothersAge) throw 99;

  } catch (int x) {
    cout << "Son cannot be older than mom. Error number: " << x << endl;
  } catch (...) { // catch any type of error
    cout << "Default error handler" << endl;
  }
}
