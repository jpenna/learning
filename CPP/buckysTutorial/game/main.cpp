#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int getWhatTheyWant();
void displayItems(int choice);

int main() {
  int whatTheyWant;

  whatTheyWant = getWhatTheyWant();

  while(whatTheyWant != 4) {
    displayItems(whatTheyWant);
    whatTheyWant = getWhatTheyWant();
  }
}

int getWhatTheyWant() {
  int choice;

  cout << endl;
  cout << "1 - just plain items" << endl;
  cout << "2 - helpful items" << endl;
  cout << "3 - harmful items" << endl;
  cout << "4 - quit" << endl;
  cout << endl;

  cin >> choice;
  return choice;
}

void printItem(string name, double power) {
  cout << name << " " << power << endl;
}

void displayItems(int choice) {
  ifstream objects("objects.txt");

  string name;
  double power;

  while(objects >> name >> power) {
    switch(choice) {
      case 1:
        if (power == 0) printItem(name, power);
        break;
      case 2:
        if (power > 0) printItem(name, power);
        break;
      case 3:
        if (power < 0) printItem(name, power);
        break;
    }
  }
}
