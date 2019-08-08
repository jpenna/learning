#include <iostream>
#include <cstdlib>
#include <string.h>

using namespace std;

struct Node {
  char *name;
  int age;

  Node(const char *n = "", int a = 0) {
    name = strdup(n);
    age = a;
  }

  Node(const Node &n) { // copy constructor
    name = strdup(n.name);
    age = n.age;
  }

  Node &operator=(const Node &n) {
    if (this != &n) {
      if (name != 0) free(name);
      name = strdup(n.name);
      age = n.age;
    }
    return *this;
  }
};

int main() {
  Node node1("Roger", 20);
  Node node2(node1);

  strcpy(node2.name, "Xerxes");

  Node node3 = node2;

  strcpy(node2.name, "Markson Johnson Hughs III of Marselle d'Ville Saint Serrant");

  // cout << "Node 1 name address: " << &node1.name << endl;
  // cout << "Node 1 age address: " << &node1.age << endl;
  // cout << "Node 2 name address: " << &node2.name << endl;
  // cout << "Node 2 age address: " << &node2.age << endl;
  // cout << "Node 3 name address: " << &node3.name << endl;
  // cout << "Node 3 age address: " << &node3.age << endl;

  strcpy(node2.name, "Markson Johnson Hughs III of Marselle d'Ville Saint Serrant");
  node2.age = 87;

  strcpy(node3.name, "Iugulasvov");

  // cout << "\nNode 1 name address: " << &node1.name << endl;
  // cout << "Node 2 name address: " << &node2.name << endl;
  // cout << "Node 3 name address: " << &node3.name << endl;

  // cout << "\nNode 1 name position 0: " << (void*) &node1.name << " " << &node1.name[0] << endl;
  // cout << "Node 1 name position 1: " << (void*) &node1.name[1] << " " << &node1.name[1] << endl;
  // cout << "Node 1 name position 2: " << (void*) &node1.name[2] << " " << &node1.name[2] << endl;
  // cout << "Node 1 name position 3: " << (void*) &node1.name[3] << " " << &node1.name[3] << endl;
  // cout << "Node 1 name position 4: " << (void*) &node1.name[4] << " " << &node1.name[4] << endl;
  // cout << "Node 1 name position 5: " << (void*) &node1.name[5] << " " << &node1.name[5] << endl;
  // cout << "Node 1 name position 6: " << (void*) &node1.name[6] << " " << &node1.name[6] << endl;
  // cout << "Node 1 name position 7: " << (void*) &node1.name[7] << " " << &node1.name[7] << endl;
  // cout << "Node 1 name position 8: " << (void*) &node1.name[8] << " " << &node1.name[8] << endl;
  // cout << "Node 1 name position 9: " << (void*) &node1.name[9] << " " << &node1.name[9] << endl;
  // cout << "Node 1 name position 10: " << (void*) &node1.name[10] << " " << &node1.name[10] << endl;
  // cout << "Node 1 name size: " << sizeof(node1.name) << endl << endl;


  // cout << "\nNode 2 name position 0: " << &node2.name[0] << endl;
  // cout << "Node 2 name position 1: " << &node2.name[1] << endl;
  // cout << "Node 2 name position 2: " << &node2.name[2] << endl;
  // cout << "Node 2 name position 3: " << (void *) *(&node2.name + 2) << " " << &node2.name[3] << endl;
  // cout << "Node 2 name position 4: " << &node2.name[4] << endl;
  // cout << "Node 2 name position 5: " << &node2.name[5] << endl;
  // cout << "Node 2 name position 6: " << &node2.name[6] << endl;
  // cout << "Node 2 name position 7: " << &node2.name[7] << endl;
  // cout << "Node 2 name position 8: " << &node2.name[8] << endl;
  // cout << "Node 2 name position 9: " << &node2.name[9] << endl;
  // cout << "Node 2 name position 10: " << &node2.name[10] << endl;
  // cout << "Node 2 name size: " << sizeof(node2.name) << endl << endl;

  // cout << "\nNode 3 name position 0: " << (void *) &(*(&node3.name)[0]) << " " << &node3.name[0] << endl;
  // cout << "Node 3 name position 1: " << &node3.name[1] << endl;
  // cout << "Node 3 name position 2: " << &node3.name[2] << endl;
  // cout << "Node 3 name position 3: " << &node3.name[3] << endl;
  // cout << "Node 3 name position 4: " << &node3.name[4] << endl;
  // cout << "Node 3 name position 5: " << &node3.name[5] << endl;
  // cout << "Node 3 name position 6: " << &node3.name[6] << endl;
  // cout << "Node 3 name position 7: " << &node3.name[7] << endl;
  // cout << "Node 3 name position 8: " << &node3.name[8] << endl;
  // cout << "Node 3 name position 9: " << &node3.name[9] << endl;
  // cout << "Node 3 name position 10: " << &node3.name[10] << endl;
  // cout << "Node 3 name size: " << sizeof(node3.name) << endl << endl;

  // cout << "Size of char: " << sizeof(char) << endl << endl;
  // cout << "Size of char*: " << sizeof(char*) << endl << endl;

  // cout << "\nNode 1 name address: " << &node1.name << endl;
  // cout << "Node 1 age address: " << &node1.age << endl;
  // cout << "Node 2 name address: " << &node2.name << endl;
  // cout << "Node 2 age address: " << &node2.age << endl;
  // cout << "Node 3 name address: " << &node3.name << endl;
  // cout << "Node 3 age address: " << &node3.age << endl << endl;

  cout << node1.name << " | age: " << node1.age << endl;
  cout << node2.name << " | age: " << node2.age << endl;
  cout << node3.name << " | age: " << node3.age << endl;
}
