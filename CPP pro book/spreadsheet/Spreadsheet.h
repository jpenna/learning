#pragma once
#include <memory>
#include "SpreadsheetCell.h"
#include "SpreadsheetImpl.h"

// class SpreadsheetApplication; // forward declaration
class SpreadsheetImpl;
class Spreadsheet {
  public:
    // Spreadsheet(const SpreadsheetApplication& app, int inWidth = kMaxWidth, int inHeight = kMaxHeight);
    Spreadsheet();
    Spreadsheet(int inWidth, int inHeight);
    ~Spreadsheet();
    Spreadsheet(const Spreadsheet& src);

    // Methods
    void setCellAt(int x, int y, const SpreadsheetCell& cell);
    SpreadsheetCell& getCellAt(int x, int y) const;
    int getId() const;

    // Operators
    Spreadsheet& operator=(const Spreadsheet& rhs);
  private:
    std::unique_ptr<SpreadsheetImpl> mImpl;
};
