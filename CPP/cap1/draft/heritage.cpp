#include <iostream>

using namespace std;

class Base {
  public:
    virtual void proc1(char c) { cout << c << "Base proc1\n"; };
    virtual void proc2(char) { cout << "Base proc2\n"; };
};

class Der : public Base {
  public:
    virtual void proc1(int) { cout << "Der proc1\n"; };
    virtual void proc2(char) { cout << "Der proc2\n"; };
};


int main() {
  Der der;
  Base *obj1 = &der,
       *obj2 = &der;

  obj1->proc2('A');
  obj1->proc1(123);
  der.proc1(1000);

}
