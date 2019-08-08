#include <iostream>
#include <cstring>

using namespace std;

void references();
void refFunctions();

// Exercicio 1
void exercicio1() {
  int i;
  int *p;
  int *q;

  p = &i;
  // p = *&i;
  // p = &*i;
  i = *&*p;
  // i = *&p;
  // i = &*p;
  p = &*&i;
  // q = *&*p;
  // q = **&p;
  q = *&p;
  q = &*p;
}

char* function(char *pointer) {
  *pointer = 'A';
  return pointer;
}

// Exercicio 2 - A
void exercicio2A() {
  char x = 'p';
  char *pointerA = &x;
  char *pointerB = function(pointerA);

  cout << *pointerA << endl; // OK: prints A
  cout << *pointerB << endl; // OK: prints A

  // remove any of the lines below, the other prints ok and there is no error
  cout << &pointerA << endl; // OK
  cout << &pointerB << endl; // OK: prints 0x...
}
// Exercicio 2 - B
void exercicio2B() {
  char *s2 = "string";
  char *s1 = new char[20];
  strcpy(s1, s2);

  cout << s1[1] << endl;
}
// Exercicio 2 - C
void exercicio2C() {
  char *s2 = "string";
  char *s1;

  cout << strlen(s2) << endl;

  s1 = new char[7];
  strcpy(s1, s2);

  cout << s1 << endl;
}
// Exercicio 2 - C
void exercicio3() {
  int intArray[] = {1,2,3};
  int *p = intArray;

  *p++; (*p)++;

  for (int i = 0; i < 3; i++) {
    cout << intArray[i] << ", ";
  }
  cout << endl;
  for (int i = 0; i < 3; i++) {
    cout << p[i] << ", ";
  }
  cout << endl;
}

// Exercise 4
template <class T>
T sumArray(T array[], int elements) {
  T sum = 0;

  for (int i = 0; i < elements; i++) {
    sum += array[i];
  }

  return sum;
}

template <class T>
T removeOdd(T array[], int size) {
  T newArray[] = new T[size];

  for (int i = 0; i < size; i++) {
    // newArray
  }

  // return sum;
}

// int array[] = {1,2,3,4,5};
// double array1[] = {1.5,2,3,4,5};

// cout << sumArray(array, 5) << endl;
// cout << sumArray(array1, 5) << endl;

int main() {
  int x = 5;
  int z = 5;
  int *p = &x, *q = &x;

  cout << p << endl;
  cout << q << endl;
  cout << *p << endl;
  cout << *q << endl;
  if (p == q) cout << "igual\n";

}
