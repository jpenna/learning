#include "SpreadsheetImpl.h"
#include <stdexcept>

/*********** Public ***********/

SpreadsheetImpl::SpreadsheetImpl(int x, int y) :
  mWidth(x < kMaxWidth ? x : kMaxWidth),
  mHeight(y < kMaxHeight ? y : kMaxHeight),
  mId(sCounter++)
  // mApp(app)
{
  mCells = new SpreadsheetCell*[mWidth];
  for (int i = 0; i < mWidth; i++) {
    mCells[i] = new SpreadsheetCell[mHeight];
  }
}

SpreadsheetImpl::~SpreadsheetImpl()
{
  clearCells();
}

SpreadsheetImpl::SpreadsheetImpl(const SpreadsheetImpl& src) :
  mId(sCounter++)
  // mApp(src.mApp)
{
  copyFrom(src);
}

/**** Methods ****/

void SpreadsheetImpl::setCellAt(int x, int y, const SpreadsheetCell& cell)
{
  if (!inRange(x, y)) throw std::out_of_range("");
  mCells[x][y] = cell;
}

SpreadsheetCell& SpreadsheetImpl::getCellAt(int x, int y) const
{
  if (!inRange(x, y)) throw std::out_of_range("");
  return mCells[x][y];
}

int SpreadsheetImpl::getId() const
{
  return mId;
}


/**** Operators ****/

SpreadsheetImpl& SpreadsheetImpl::operator=(const SpreadsheetImpl& rhs) {
  if (this == &rhs) return *this;
  clearCells();
  copyFrom(rhs);
  return *this;
};

/*********** Private ***********/

int SpreadsheetImpl::sCounter;

/**** Helper Methods ****/

void SpreadsheetImpl::clearCells()
{
  for (int i = 0; i < mWidth; i++) delete[] mCells[i];
  delete[] mCells;
  mCells = nullptr;
}

void SpreadsheetImpl::copyFrom(const SpreadsheetImpl& src)
{
  mHeight = src.mHeight;
  mWidth = src.mWidth;

  mCells = new SpreadsheetCell*[mWidth];
  for (int i = 0; i < mWidth; i++) {
    mCells[i] = new SpreadsheetCell[mHeight];
    for (int j = 0; j < mHeight; j++) {
      mCells[i][j] = src.mCells[i][j];
    }
  }
}

bool SpreadsheetImpl::inRange(int x, int y) const
{
  if (x >= mWidth || y >= mHeight) return false;
  return true;
}
