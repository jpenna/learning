#include <iostream>
#include <string>

using namespace std;

class MyClass {
  public:
    MyClass(int num) : h(num) {};
    void print() {
      cout << "h = " << h << endl;
      cout << "this-> = " << this->h << endl;
      cout << "(*this).h = " << (*this).h << endl << endl;
      cout << "this = " << this << endl;
    };
  private:
    int h;
};

int main() {
  MyClass myClass(99);
  myClass.print();
  cout << "Reference to obj: " << &myClass << endl;
}
