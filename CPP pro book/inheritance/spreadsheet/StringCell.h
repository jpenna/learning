#pragma once
#include <iostream>
#include "SpreadsheetCell.h"

using namespace std;

class StringCell : public SpreadsheetCell
{
  public:
    StringCell(const string& value = "");
    void setValue(const string& value) override;
    string getValue() const override;
    void xx() const { cout << "xxx" << endl; };
  private:
    string mValue;
};
