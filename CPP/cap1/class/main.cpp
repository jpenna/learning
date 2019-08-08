#include <iostream>
#include <string.h>
#include "estocagem.cpp"

using namespace std;

class C {
  public:
    C (const char *s = "", int i = 0, double d = 1) {
      strcpy(dadosMembro1, s);
      dadosMembro2 = i;
      dadosMembro3 = d;
    }

    void funcaoMembro1() {
      cout << dadosMembro1 << ' ' << dadosMembro2 << ' '
        << dadosMembro3 << '\n' << endl;
    }

    void funcaoMembro2(int i, const char *s = "desconhecido") {
      dadosMembro2 = i;
      cout << i << " recebido de " << s << endl;
    }

  protected:
    char dadosMembro1[20];
    int dadosMembro2;
    double dadosMembro3;
};

int main() {
  C object1("objeto1", 100, 200);
  C object2("obj", 100, 300);
  C object3;

  object1.funcaoMembro1();
  object2.funcaoMembro1();
  object3.funcaoMembro1();

  object1.funcaoMembro2(123, "Juliano Penna");

  estocagem();
};
