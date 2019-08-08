#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>

using namespace std;

template<class T>
void printVector(const char *s, const vector<T>& v) {
  cout << "\n" << s << "\nSize: " << v.size() << " | Capacity: " << v.capacity() << endl;

  cout << "(";

  if (v.size() == 0) {
    cout << ")\n";
    return;
  }

  typename vector<T>::const_iterator i = v.begin();

  for (; i != v.end() - 1; i++) cout << *i << ' ';

  cout << *i << ")\n";
}

bool f1(int n) {
  return n < 4;
}

int main() {
  int a[] = {1, 2, 3, 4, 5};

  // Create and modify vector
  vector<int> v1;
  printVector("v1", v1);

  for (int j = 1; j <= 5; j++) v1.push_back(j);
  printVector("v1 - after add", v1);

  vector<int> v2(3,7);
  printVector("v2", v2);

  vector<int>::iterator i1 = v1.begin() + 1;
  vector<int> v3(i1, i1+2);
  printVector("v3", v3);
  vector<int> v4(v1);
  printVector("v4 - v1 copy", v4);
  vector<int> v5(5);
  printVector("v5", v5);
  v5[1] = v5.at(3) = 9;
  printVector("v5 - add num", v5);

  v3.reserve(6);
  printVector("v3 - reserve(6)", v3);

  v4.resize(7);
  printVector("v4 - resize(7)", v4);

  v4.resize(3);
  printVector("v4 - resize(3)", v4);

  v4.clear();
  printVector("v4 - clear()", v4);

  // Insert and delete
  v4.insert(v4.end(), v3[1]);
  printVector("v4 - insert", v4);

  v4.insert(v4.end(), v3.at(0));
  printVector("v4 - insert at", v4);

  v4.insert(v4.end(), 2, 4);
  printVector("v4 - insert 2 4", v4);

  v4.insert(v4.end(), v1.begin() + 1, v1.end() - 1);
  printVector("v4 - end begin end", v4);

  v4.erase(v4.end() - 2);
  printVector("v4 - erase end", v4);

  v4.erase(v4.begin(), v4.begin() + 4);
  printVector("v4 - erase begin end", v4);

  v4.assign(3, 8);
  printVector("v4 - assign", v4);

  v4.assign(a, a + 2);
  printVector("v4 - assign", v4);

  vector<int>::reverse_iterator i3 = v4.rbegin();
  for (; i3 != v4.rend(); i3++) cout << *i3 << endl;
  cout << endl;

  v5[0] = 3;
  printVector("v5 - 0", v5);

  replace_if(v5.begin(), v5.end(), f1, 7);
  printVector("v5 - replace_if", v5);

  v5[0] = 3;
  v5[2] = v5[4] = 0;
  printVector("v5 - set values", v5);

  replace(v5.begin(), v5.end(), 0, 7);
  printVector("v5 - replace", v5);

  sort(v5.begin(), v5.end());
  printVector("v5 - sort", v5);

  sort(v5.begin(), v5.end(), greater<int>());
  printVector("v5 - sort func", v5);

  v5.front() = 2;
  printVector("v5 - front", v5);
}
