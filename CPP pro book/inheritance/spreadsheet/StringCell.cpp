#include <iostream>
#include "StringCell.h"

using namespace std;

StringCell::StringCell(const string& value)
  : mValue(value)
{
};

void StringCell::setValue(const string& value)
{
  mValue = value;
};

string StringCell::getValue() const
{
  return mValue;
};
