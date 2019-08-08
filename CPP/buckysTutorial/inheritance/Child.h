#ifndef CHILD_H
#define CHILD_H

#include <string>
#include "Mother.h"

using namespace std;

class Child : public Mother {
  public:
    Child();
    ~Child();
    void sayIt();
    void defineIt();
};

#endif
