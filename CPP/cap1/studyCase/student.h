#include "personal.h"

#ifndef STUDENT
#define STUDENT

class Student : public Personal {
  public:
    Student();
    Student(char*, char*, char*, int, long, char*);

    void writeToFile(fstream&) const;
    void readFromFile(fstream&);

    int size() const {
      return Personal::size() + majorLen;
    }
  protected:
    char *major;
    const int majorLen;

    ostream& writeLegibly(ostream&);
    istream& readFromConsole(istream&);

    friend ostream& operator<<(ostream& out, Student& sr) {
      return sr.writeLegibly(out);
    }
    friend istream& operator>>(istream& in, Student& sr) {
      return sr.readFromConsole(in);
    }
};

#endif
