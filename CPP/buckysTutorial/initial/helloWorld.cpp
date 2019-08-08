#include <iostream>
#include <string>
#include "Burrito.h"

using namespace std;

void print(const char* a);
void sumNumbers();

class MyClass {
  public:
    MyClass(string n) {
      name = n;
      cout << "print Constructor\n";
    }

    void setName(string n) {
      name = n;
    }

    string getName() {
      return name;
    }

  private:
    string name;
};

int main() {
  for (int i = 0; i <= 10; si + 5) {
    cout << i << endl;
  }
}

void print(const char* text) {
  cout << text << endl;
}

void sumNumbers() {
  int a;
  int b;
  int sum;

  cout << "Enter a number \n";
  cin >> a;

  if (a < 10) {
    print("The number must be greater than 10\n");
    return;
  };

  cout << "Enter another number \n";
  cin >> b;

  sum = a + b;
  cout << "The sum is: " << sum << endl;
}

void inputSum() {
    int age;
  int ageTotal = 0;
  int peopleCount = 0;

  // cout << "Enter first age or -1 to quit" << endl;
  // cin >> age;

  while (true) {
    cout << "Enter age or -1 to quit" << endl;
    cin >> age;

    if (age == -1) break;

    ageTotal += age;
    peopleCount++;
  }

  cout << "People entered: " << peopleCount << endl;
  cout << "Sum of ages: " << ageTotal << endl;
  cout << "Average age: " << ageTotal / peopleCount << endl;
}

void importedClass() {
  MyClass yo("Shit!");
  cout << yo.getName() << endl;

  yo.setName("yo");
  cout << yo.getName() << endl;

  Burrito burrito; //  print yoooo
}
