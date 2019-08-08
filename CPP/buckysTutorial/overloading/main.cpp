#include <iostream>
#include <string>

using namespace std;

class MyClass {
  public:
    int num;
    string name;
    MyClass(string);
    MyClass(string, int);
    MyClass operator+(MyClass);
  private:
    int h;
};

MyClass::MyClass(string n) { name = n; };
MyClass::MyClass(string n, int a) { num = a; name = n; };

MyClass MyClass::operator+(MyClass obj) {
  cout << "this " << this->name << endl;
  cout << "obj " << obj.name << endl;

  MyClass brandNew("brandNew");
  brandNew.num = num + obj.num;
  return brandNew;
}

int main() {
  MyClass a("A", 34);
  MyClass b("B", 9);

  MyClass c = a + b;

  cout << c.num << endl;
}
