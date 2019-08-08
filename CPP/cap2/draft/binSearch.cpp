#include <iostream>

using namespace std;

int main() {
  int array[] = {1,2,3,4,5,6,7,8,9,10};
  int search = 0;
  int found;

  int n = sizeof array / sizeof(int);

  int low = 0, high = n, middle;

  while(low <= high) {
    middle = (high + low) / 2;
    if (search < array[middle]) high = middle - 1;
    else if (search > array[middle]) low = middle + 1;
    else {
      found = middle;
      break;
    }
    cout << "\n-------------" << endl;
    cout << "high: " << high << endl;
    cout << "low: " << low << endl;
    cout << "middle: " << middle << endl;
  }

  cout << "Found: " << found << endl;

}
