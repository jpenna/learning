#include <iostream>
#include <sstream>
#include "DoubleCell.h"

using namespace std;

DoubleCell::DoubleCell(double value)
  : mValue(value)
{
};

void DoubleCell::setValue(const string& value)
{
  mValue = stringToDouble(value);
};

void DoubleCell::setValue(double value)
{
  mValue = value;
};

string DoubleCell::getValue() const
{
  return doubleToString(mValue);
};

string DoubleCell::doubleToString(double inValue)
{
  ostringstream ostr;
  ostr << inValue;
  return ostr.str();
};

double DoubleCell::stringToDouble(string inString)
{
  double temp;
  istringstream istr(inString);
  istr >> temp;
  if (istr.fail() || !istr.eof()) {
    return 0;
  }
  return temp;
};
