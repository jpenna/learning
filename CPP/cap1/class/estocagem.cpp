#include <iostream>
#include <string.h>

using namespace std;

template <class dumpType, int size = 50>
class Estoque {
  dumpType estoque[size];
};

void receive(int &i, int *j) {
  cout << "ok";
}

void estocagem() {
  Estoque<int> intDump;
  Estoque<float, 30> floatDump;

  int x = 1;
  int y = 2;

  receive(&x, &y);

};
