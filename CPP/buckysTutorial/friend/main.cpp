#include <iostream>
#include <string>

using namespace std;

class Person {
  public:
    Person(string n) : name(n) {};
    string getName() { return name; };
  private:
    string name;

  friend void changeName(Person &p, string n);
};

void changeName(Person &p, string n) {
  p.name = n;
}

int main() {
  Person me("Juliano");
  cout << "My name is " << me.getName() << endl;

  changeName(me, "Juliano Penna");
  cout << "My name is " << me.getName() << endl;
}
