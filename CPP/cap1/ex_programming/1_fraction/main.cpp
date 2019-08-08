#include "fraction.h"

int main() {
  char s1[80];
  char s2[80];
  char option[5];
  Fraction frac1;
  Fraction frac2;
  Fraction result;

  while(true) {
    cout << "Enter an option:\n";
    cout << "\t1. Sum\n";
    cout << "\t2. Subtract\n";
    cout << "\t3. Multiply\n";
    cout << "\t4. Divide\n\n";

    cin.getline(option, 5);

    if (*option < '1' || *option > '4') {
      cout << "Enter a valid option.\n\n";
      continue;
    }

    cout << "Enter fraction 1: ";
    cin.getline(s1, 80);
    if (!*s1) return 99;

    cout << "Enter fraction 2: ";
    cin.getline(s2, 80);
    if (!*s2) return 99;

    frac1 = s1;
    frac2 = s2;

    switch(*option) {
      case '1': {
        result = frac1 + frac2;
        break;
      }
      case '2': {
        result = frac1 - frac2;
        break;
      }
      case '3': {
        result = frac1 * frac2;
        break;
      }
      case '4': {
        result = frac1 / frac2;
        break;
      }
    }

    cout << "Result: " << result << "\n\n";
  }
}
