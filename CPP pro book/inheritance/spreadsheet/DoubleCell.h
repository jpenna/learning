#pragma once
#include <iostream>
#include <limits>
#include "SpreadsheetCell.h"

using namespace std;

class DoubleCell : public SpreadsheetCell
{
  public:
    DoubleCell(double value = numeric_limits<double>::quiet_NaN());
    void setValue(const string& value) override;
    void setValue(double value);
    string getValue() const override;
  private:
    static string doubleToString(double d);
    static double stringToDouble(string s);
    double mValue;
};
