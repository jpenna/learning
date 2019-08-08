#include <iostream>

using namespace std;

class BaseClass {
  public:
    BaseClass() {};
    void f(const char *s = "unknown") {
      cout << "The function f() in BaseClass called from " << s << endl;
      h();
    }
    protected:
      void g(const char *s = "unknown") {
        cout << "The function g() in BaseClass called from " << s << endl;
      }
    private:
      void h() {
        cout << "The function h() in BaseClass" << endl;
      }
};

class Derived1_Lv1: public virtual BaseClass {
  public:
    void f(const char *s = "unknown") {
      cout << "The function f() in Derived1_Lv1 called from " << s << endl;
      g("Derived1_Lv1");
      h("Derived1_Lv1");
    }
    void h(const char *s = "unknown") {
      cout << "The function h() in Derived1_Lv1 called from " << s << endl;
    }
};

class Derived2_Lv1: public virtual BaseClass {
  public:
    void f(const char *s = "unknown") {
      cout << "The function f() in Derived2_Lv1 called from " << s << endl;
      g("Derived2_Lv1");
      // h();
    }
};

class Derived_Lv2: public Derived1_Lv1, public Derived2_Lv1 {
  public:
    void f(const char *s = "unknown") {
      cout << "The function f() in Derived_Lv2 called from " << s << endl;
      g("Derived_Lv2");
      Derived1_Lv1::h("Derived_Lv2");
      BaseClass::f("Derived_Lv2");
    }
};

int main() {
  BaseClass base;
  base.f("BASE");

  Derived1_Lv1 d1;
  d1.f("D1");
  d1.h("D1");

  Derived2_Lv1 d2;
  d1.f("D1");

  Derived_Lv2 d_l;
  d_l.f("DL");
}
