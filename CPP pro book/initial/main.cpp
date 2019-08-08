#include <iostream>
#include <array>
#include <memory>
#include <vector>
#include <cstring>
#include <string>

using namespace std;

int main() {
  const int i = 13;
  int* p = const_cast<int*>(&i);
  int p = i;

  p = 10;

  cout << i << endl;
  cout << p << endl;


  return 0;
}
