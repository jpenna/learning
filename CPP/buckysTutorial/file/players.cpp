#include <iostream>
#include <fstream>
#include <string>

using namespace std;

void players() {
  // ofstream players("players.txt");

  // if (players.is_open()) {
  //   cout << "Enter players ID, name and money (space separated)\n";
  //   cout << "Press CTRL + Z to exit.\n";

  //   int playerId;
  //   string name;
  //   double money;

  //   while(cin >> playerId >> name >> money) {
  //     players << playerId << " " << name << " " << money << endl;
  //   }

  //   players.close();

  // } else {
  //   cout << "File is not opened.";
  // }

  ifstream theFile("players.txt");

  int id;
  string name;
  double money;

  while(theFile >> id >> name >> money) {
    cout << id << ", " << name << ", " << money << endl;
  }
}
