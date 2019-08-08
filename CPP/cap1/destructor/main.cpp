#include <iostream>
#include <stdlib.h>
#include <string.h>

using namespace std;

struct Node {
  char *name;
  int age;
  Node(const char *n, int a) {
    name = strdup(n);
    age = a;
    cout << "\nConstructor: " << name << " | " << age << endl;
  }
  ~Node() {
    cout << "Destructor for " << name << endl;
    if (name != 0) free(name);
  }
};

int main() {
  Node *p;
  {
    Node node("Gray", 23);
    p = &node;
    cout << "Inside -> " << node.name << " | " << node.age << endl;
    // delete &node;
  }
  cout << "\nPointer to " << p << endl;
  // cout << "Outside age:" << *p << endl;
  cout << "\nOutside -> " << p->name << " | " << p->age << endl;

  // DESTRUCTOR
  // It don't destruct if i have a pointer to the object?

  {
    Node node{"Blue", 23};
  }

}
