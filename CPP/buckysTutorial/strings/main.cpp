#include <iostream>
#include <string>

using namespace std;

int main() {
  // cin alone reads until the space " "

  string s1("string ");
  string s2;
  string s3;

  s2 = s1;
  s3.assign(s1);

  cout << s1 << s2 << s3 << endl << endl;

  cout << "String as array: " << s1[2] << endl;
  cout << "String .at: " << s1.at(2) << endl;
  cout << "String length: " << s1.length() << endl << endl;

  string big("this is a big string for test");
  string small("smaller");
  cout << "Substring: " << big.substr(1, 3) << endl << endl;
  big.swap(small);
  cout << "Swap: Small -> " << small << " | Big -> " << big << endl << endl;
  big.swap(small);

  // Find
  cout << "Find: " << big.find("is") << endl;
  cout << "Reverse find: " << big.rfind("is") << endl << endl;

  // Erase
  string copy = big;
  cout << "Original: " << copy << endl;
  copy.erase(10);
  cout << copy << endl << endl;

  copy = big;
  copy.replace(2, 5, " REPLACED ");
  cout << copy << endl << endl;

  copy = big;
  copy.insert(4, " INSERTED ");
  cout << copy << endl;

  // string x;
  // cout << "Write something: ";
  // getline(cin, x);
  // cout << "You wrote: " << x << endl;
}
