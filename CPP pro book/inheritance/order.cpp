#include <iostream>
#include <string>

using namespace std;

class Something
{
  public:
    Something() { cout << "def" << endl; };
    Something(string s) { cout << s << endl; };
    ~Something() { cout << "bye something" << endl; };
};

class Super
{
  public:
    Super(int i = 666)
      { cout << "Super " << i << endl; };
    string pubber = "pubber super";
    virtual ~Super() { cout << "bye super" << endl; }; // virtual destructor
    void printPubber() { cout << "Pubber is super: " << pubber << endl; };

  private:
    Something some;
};

class Child : public Super
{
  private:
    Something some;
  public:
    Child()
      : some(Something(Something("priv child"))), Super(x)
      { cout << "child" << endl; };
    Something pub;
    int pubber;
    void printPubber() { cout << "Pubber is child: " << pubber << endl; };
    int x = 10;
    ~Child() { cout << "bye child" << endl; };
};

int main ()
{
  Super* child = new Child();
  child->pubber = 90;
  child->printPubber();
  cout << endl;
  delete child;
}
