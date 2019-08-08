#include "fraction.h"

Fraction::Fraction(string value) {
  buildFromString(value);
}

Fraction::Fraction(int n, int d) {
  numerator = n;
  denominator = d;
}

void Fraction::checkNumber(string value) {
  try {
    double number = stod(value);

    double calcNumerator = number;
    denominator = 0;
    double rest;

    do {
      denominator++;
      calcNumerator = number * denominator;
      rest = fmod(calcNumerator, 1);
    } while (rest != 0);

    numerator = calcNumerator;
  } catch (const invalid_argument& ia) {
    cout << "Invalid value. Enter a fraction (3/4) or number (5.32).";
    return;
  }
}

ostream& operator<<(ostream& out, Fraction& frac) {
  frac.simplify();
  if (frac.denominator == 1) {
    out << frac.numerator;
  } else {
    out << frac.numerator << "/" << frac.denominator;
  }
  return out;
}

Fraction Fraction::operator=(string value) {
  buildFromString(value);
}

void Fraction::buildFromString(string value) {
  char num[80];
  char den[80];
  size_t length;

  trim(value);
  int pos = value.find_first_of('/');

  if (pos < 0) {
    checkNumber(value);
  } else {
    length = value.copy(num, pos);
    num[length] = '\0';

    length = value.copy(den, value.length(), pos + 1);
    den[length] = '\0';

    numerator = stoi(num);
    denominator = stoi(den);
  }
}

void Fraction::simplify() {
  double division = (double)numerator / denominator;
  int primes[5] = {2, 3, 5, 7, 11};

  if (fmod(division, 1) == 0) {
    numerator = division;
    denominator = 1;
  } else {
    int size = sizeof primes / sizeof primes[0];
    for (int i = 0; i < size; i++) {
      double divNum = (double)numerator / primes[i];
      double divDen = (double)denominator / primes[i];

      if (fmod(divNum, 1) == 0 && fmod(divDen, 1) == 0) {
        numerator = divNum;
        denominator = divDen;
        i = -1; // reset loop
      }
    }
  }
}

Fraction Fraction::operator+(Fraction frac) {
  int num1 = numerator * frac.denominator;
  int num2 = frac.numerator * denominator;

  int den = denominator * frac.denominator;

  return Fraction(num1 + num2, den);
}

Fraction Fraction::operator-(Fraction frac) {
  int num1 = numerator * frac.denominator;
  int num2 = frac.numerator * denominator;

  int den = denominator * frac.denominator;

  return Fraction(num1 - num2, den);
}

Fraction Fraction::operator*(Fraction frac) {
  int num = numerator * frac.numerator;
  int den = denominator * frac.denominator;

  return Fraction(num, den);
}

Fraction Fraction::operator/(Fraction frac) {
  int num = numerator * frac.denominator;
  int den = denominator * frac.numerator;

  return Fraction(num, den);
}
