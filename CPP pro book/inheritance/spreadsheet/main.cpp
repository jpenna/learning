// gcc -lstdc++ -std=c++1y -o main main.cpp DoubleCell.cpp StringCell.cpp && ./main

#include <iostream>
#include <vector>
#include <memory>

#include "SpreadsheetCell.h"
#include "StringCell.h"
#include "DoubleCell.h"

using namespace std;

class Amb : public DoubleCell
{
  public:
    using DoubleCell::DoubleCell;
};

int main()
{
  vector<unique_ptr<SpreadsheetCell>> cellArray;

  cellArray.push_back(make_unique<StringCell>("first"));
  cellArray.push_back(make_unique<StringCell>("second"));
  cellArray.push_back(make_unique<Amb>(12));


  cout << cellArray[2]->getValue() << endl;

};
