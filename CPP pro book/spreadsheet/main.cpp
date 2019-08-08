// gcc --std=c++1y -lstdc++ -o main main.cpp Spreadsheet.cpp SpreadsheetCell.cpp SpreadsheetImpl.cpp && ./main
#include "SpreadsheetCell.h"
#include "Spreadsheet.h"
#include <iostream>
#include <memory>

using namespace std;

int main()
{
  Spreadsheet s1, s2(4, 5), s3;

  s3 = s2;

  SpreadsheetCell c1(90);

  s2.setCellAt(1, 3, c1);

  s1 = s2;

  cout << s1.getCellAt(1, 3).getValue() << endl;
  cout << s2.getCellAt(1, 3).getValue() << endl;
  cout << s3.getCellAt(1, 3).getValue() << endl;

  return 0;
}
