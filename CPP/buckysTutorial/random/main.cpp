#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main() {
  cout << "Fixed random: ";
  for (int i = 0; i < 20; i++) {
    cout << rand() % 6 + 1 << ", ";
  }
  cout << endl;

  srand(time(0));

  cout << "Random: ";
  for (int i = 0; i < 20; i++) {
    cout << rand() % 6 + 1 << ", ";
  }
  cout << endl;
}
