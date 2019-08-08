#include "SpreadsheetCell.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

/*********** Public ***********/

SpreadsheetCell::SpreadsheetCell(double initialValue) :
  mValue(initialValue)
{
}

SpreadsheetCell::SpreadsheetCell(const string& initialString) :
  mValue(0), mString(initialString)
{
}

/**** Methods ****/

/**** Helpers ****/

string SpreadsheetCell::doubleToString(double inValue)
{
  ostringstream ostr;
  ostr << inValue;
  return ostr.str();
};

double SpreadsheetCell::stringToDouble(string inString)
{
  double temp;
  istringstream istr(inString);
  istr >> temp;
  if (istr.fail() || !istr.eof()) {
    return 0;
  }
  return temp;
};

/**** Getter and Setters ****/

void SpreadsheetCell::set(double inValue)
{
  mValue = inValue;
  mString = doubleToString(mValue);
};

void SpreadsheetCell::set(const string& inString)
{
  mString = inString;
  mValue = stringToDouble(mString);
};

void SpreadsheetCell::setColor(Colors color) {
  mColor = color;
};

SpreadsheetCell::Colors SpreadsheetCell::getColor() const {
  return mColor;
};

/**** Operators ****/

// // Implicit constructor (conversion type)
// SpreadsheetCell SpreadsheetCell::operator+(const SpreadsheetCell& rhs) const {
//   int value = mValue + rhs.mValue;
//   SpreadsheetCell sum(value);
//   return sum;
// };

// // Inefficiency: better create a double
// SpreadsheetCell SpreadsheetCell::operator+(double rhs) const {
//   return SpreadsheetCell(mValue + rhs);
// }

SpreadsheetCell operator+(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return SpreadsheetCell(lhs.mValue + rhs.mValue);
}
SpreadsheetCell operator-(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return SpreadsheetCell(lhs.mValue - rhs.mValue);
}
SpreadsheetCell operator*(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return SpreadsheetCell(lhs.mValue * rhs.mValue);
}
SpreadsheetCell operator/(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  if (rhs.mValue == 0) throw invalid_argument("Division by zero.");
  return SpreadsheetCell(lhs.mValue / rhs.mValue);
}

SpreadsheetCell& SpreadsheetCell::operator+=(const SpreadsheetCell& rhs) {
  set(mValue + rhs.mValue);
  return *this;
};
SpreadsheetCell& SpreadsheetCell::operator-=(const SpreadsheetCell& rhs) {
  set(mValue - rhs.mValue);
  return *this;
};
SpreadsheetCell& SpreadsheetCell::operator*=(const SpreadsheetCell& rhs) {
  set(mValue * rhs.mValue);
  return *this;
};
SpreadsheetCell& SpreadsheetCell::operator/=(const SpreadsheetCell& rhs) {
  if (rhs.mValue == 0) throw invalid_argument("Division by zero.");
  set(mValue / rhs.mValue);
  return *this;
};

bool operator==(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return lhs.mValue == rhs.mValue;
};
bool operator<(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return lhs.mValue < rhs.mValue;
};
bool operator!=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return !(lhs == rhs);
};
bool operator>(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return !(lhs < rhs);
};
bool operator>=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return !(lhs < rhs) || lhs == rhs;
};
bool operator<=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs) {
  return lhs < rhs || lhs == rhs;
};
