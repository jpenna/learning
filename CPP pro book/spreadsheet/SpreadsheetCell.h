#pragma once
#include <string>

using namespace std;

// #define SPREADSHEETCELL_RED 1
// #define SPREADSHEETCELL_GREEN 2
// #define SPREADSHEETCELL_BLUE 3
// #define SPREADSHEETCELL_YELLOW 4
// enum is prefered: When you use #define s, you have to use an integer parameter for the setColor() function instead of a clear type like the Colors enumerated type.

class SpreadsheetCell
{
  public:
    /* friend can access private and protected data members */
    // friend class Spreadsheet;
    // friend void Spreadsheet::friendMethodOfSpreadsheet(const SpreadsheetCell& cell);
    // friend bool someFunction(const SpreadsheetCell& cell);
    SpreadsheetCell() = default; // default or delete
    SpreadsheetCell(double initialValue);
    explicit SpreadsheetCell(const std::string& initialString); // explicit: constructor called only explicitly (only makes sense for 1 param or mult w/ defaut constructors)

    enum class Colors { Red = 1, Green, Blue, Yellow };

    // Getters and Setters
    void set(double inValue);
    void set(const std::string& inString);
    void setColor(Colors color);

    inline double getValue() const; // const: does not change the object
    inline const std::string& getString() const; // inline: compiler hint to inline, it may ignore if hurt performance
    Colors getColor() const;

    // Helpers
    static std::string doubleToString(double inValue);
    static double stringToDouble(std::string inString);

    // Operators
    friend SpreadsheetCell operator+(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend SpreadsheetCell operator-(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend SpreadsheetCell operator*(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend SpreadsheetCell operator/(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);

    SpreadsheetCell& operator+=(const SpreadsheetCell& rhs);
    SpreadsheetCell& operator-=(const SpreadsheetCell& rhs);
    SpreadsheetCell& operator*=(const SpreadsheetCell& rhs);
    SpreadsheetCell& operator/=(const SpreadsheetCell& rhs);

    friend bool operator==(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend bool operator!=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend bool operator>(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend bool operator>=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend bool operator<(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);
    friend bool operator<=(const SpreadsheetCell& lhs, const SpreadsheetCell& rhs);

  private:
    double mValue;
    string mString;
    mutable int mNumAccesses = 0; // const methods can change this
    Colors mColor = Colors::Red;
};

// Inline

double SpreadsheetCell::getValue() const
{
  mNumAccesses++;
  return mValue;
};

const string& SpreadsheetCell::getString() const
{
  mNumAccesses++;
  return mString;
};
