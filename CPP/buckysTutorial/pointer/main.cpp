#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

void printArray(int array[], int size);
void printMultidimension(int array[][3], int x, int y);

int main() {
  double fixed[3] = {1,2,3};
  int number = 89;
  cout << "Fixed array[0]: " << fixed[0] << endl;

  double *pf = &fixed[0];
  double *pf1 = &fixed[1];
  double *pf2 = &fixed[2];

  int *pNumber = &number;

  cout << "pf is at: " << pf << endl;
  cout << "pf1 is at: " << pf1 << endl;
  cout << "pf1 is at: " << pf2 << endl;
  cout << "pNumber is at: " << pNumber << endl;

  pf = pf + 2;
  cout << "pf is now at: " << pf << endl;
  cout << "pf has value: " << *pf << endl;

  int size = 9;
  int array[size];

  // srand(time(0));

  for(int i = 0; i < size; i++) {
    int value = i * (rand() % 10);
    array[i] = value;
  }

  printArray(array, size);

  int x = 2, y = 3;

  int multiArray[2][3] = {{1,2,3}, {4,5,6}};

  printMultidimension(multiArray, x, y);
}

void printArray(int array[], int size) {
  cout << "Array: ";
  for (int i = 0; i < size; i++) {
    cout << array[i] << ", ";
  }
  cout << endl;
}

void printMultidimension(int array[][3], int x, int y) {
  for(int row = 0; row < x; row++) {
    for(int col = 0; col < y; col++) {
      cout << array[row][col] << " ";
    }
    cout << endl;
  }
}
