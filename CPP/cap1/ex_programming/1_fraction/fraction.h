#include <iostream>
#include <string>

#include "utils.cpp"

using namespace std;

#ifndef FRACTION
#define FRACTION

class Fraction {
  public:
    Fraction() {};
    Fraction(string);
    Fraction(int, int);

    Fraction operator=(string);

    Fraction operator+(Fraction);
    Fraction operator-(Fraction);
    Fraction operator*(Fraction);
    Fraction operator/(Fraction);

  private:
    int numerator;
    int denominator;
    void checkNumber(string);
    void buildFromString(string);
    void simplify();

  friend ostream& operator<<(ostream&, Fraction&);
};

#endif
