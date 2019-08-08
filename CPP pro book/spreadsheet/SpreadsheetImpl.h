#pragma once
#include "SpreadsheetCell.h"

/*
Nested class
using xxx = SpreadsheetImpl::SpreadsheetCell
SpreadsheetImpl::SpreadsheetCell& SpreadsheetImpl::SpreadsheetCell::operator=(const SpreadsheetCell& rhs)
*/

// class SpreadsheetApplication; // forward declaration
class SpreadsheetImpl {
  public:
    // SpreadsheetImpl(const SpreadsheetApplication& app, int inWidth = kMaxWidth, int inHeight = kMaxHeight);
    SpreadsheetImpl(int inWidth = kMaxWidth, int inHeight = kMaxHeight);
    ~SpreadsheetImpl();
    SpreadsheetImpl(const SpreadsheetImpl& src);

    // Data
    static const int kMaxWidth = 100;
    static const int kMaxHeight = 100;

    // Methods
    void setCellAt(int x, int y, const SpreadsheetCell& cell);
    SpreadsheetCell& getCellAt(int x, int y) const;
    int getId() const;

    // Operators
    SpreadsheetImpl& operator=(const SpreadsheetImpl& rhs);
  private:
    const int mId;
    int mWidth, mHeight;
    SpreadsheetCell** mCells;
    // const SpreadsheetApplication& mApp;
    static int sCounter;

    // Helpers
    void clearCells();
    void copyFrom(const SpreadsheetImpl& src);
    bool inRange(int x, int y) const;
};
