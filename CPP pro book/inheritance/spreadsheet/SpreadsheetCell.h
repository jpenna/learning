#pragma once
#include <iostream>

using namespace std;

class SpreadsheetCell
{
  public:
    SpreadsheetCell() = default;
    virtual ~SpreadsheetCell() = default;
    virtual void setValue(const string& s) = 0;
    virtual string getValue() const = 0;
};
