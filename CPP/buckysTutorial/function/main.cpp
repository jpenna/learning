#include <iostream>
#include <string>

using namespace std;

string volume();
int volume(int l, int w = 2, int h = 2);
float volume(float l, float w = 2, float h = 2);
int factorial(int n);

float length = 2.54;

int main() {
  int length = 10;

  cout << "Volume 1 (int): " << volume(length) << endl;
  cout << "Volume 2 (float): " << volume(::length) << endl;
  cout << "Volume 3 (): " << volume() << endl;

  cout << "Factorial: " << factorial(10) << endl;
}

int factorial(int n) {
  if (n == 1) return 1;
  return n * factorial(n - 1);
}

string volume() {
  return "Put some data, mother #!@%";
}

int volume(int l, int w, int h) {
  return l * w * h;
}

float volume(float l, float w, float h) {
  return l * w * h;
}
