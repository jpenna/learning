#include <iostream>
#include <fstream>
#include "players.cpp"

using namespace std;

int main() {
  ofstream file;
  file.open("tuna.txt");

  file << "i love tuna and tuna loves me!\n";

  file.close();

  ofstream file2("fish.txt");
  if (file2.is_open()) {
    cout << "The file is open" << endl;
  } else {
    cout << "The file is not associated with the object" << endl;
  }

  file2 << "I am tuna" << endl;

  file2.close();

  players();
}
