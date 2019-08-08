#include <iostream>

using namespace std;

// class Super final { // cannot derive
class Super
{
  public:
    Super() = default;
    virtual void method() const
    {
      cout << "super method" << endl;
    };
    // virtual void getP() const final
    virtual void getP() const
    {
      cout << p << endl;
    }

  protected:
    int p = 8;

  private:
    int v = 99;
};

class Sub : public Super
{
  public:
    void subMethod()
    {
      cout << "sub method" << endl;
    };

    void method() const override {
      cout << "overriden " << p << endl;
    }

    void setP(int inP) {
      p = inP;
    }

    void print()
    {
      cout << p << endl;
    }
};

int main()
{
  Super super = Super();
  Sub sub = Sub();

  sub.setP(90);
  Super cp = sub;


  sub.print();
  cp.getP();

}
