#include <memory>
#include "Spreadsheet.h"
#include "SpreadsheetImpl.h"

using namespace std;

Spreadsheet::Spreadsheet() {
  mImpl = make_unique<SpreadsheetImpl>();
};
Spreadsheet::Spreadsheet(int inWidth, int inHeight) {
  mImpl = make_unique<SpreadsheetImpl>(inWidth, inHeight);
};
Spreadsheet::Spreadsheet(const Spreadsheet& src) {
  mImpl = make_unique<SpreadsheetImpl>(*src.mImpl);
};
Spreadsheet::~Spreadsheet() {
};

// Methods
void Spreadsheet::setCellAt(int x, int y, const SpreadsheetCell& cell) {
  mImpl->setCellAt(x, y, cell);
};
SpreadsheetCell& Spreadsheet::getCellAt(int x, int y) const {
  return mImpl->getCellAt(x, y);
};
int Spreadsheet::getId() const {
  return mImpl->getId();
};

// Operators
Spreadsheet& Spreadsheet::operator=(const Spreadsheet& rhs) {
  *mImpl = *rhs.mImpl;
  return *this;
};
