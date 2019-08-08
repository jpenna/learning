#ifndef SALLY_H
#define SALLY_H

#include <iostream>

using namespace std;

class Sally {
  public:
    Sally(int a, int b, int c);
    Sally(int constVar);
    void printVars();
    void printCrap();
    ~Sally();
    void printX();
    void printX2() const;

  private:
    int regVar;
    int regVar2;
    const int constVar;
};

#endif
