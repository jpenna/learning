#include "iostream"

using namespace std;

class Super {
  public:
    Super() = default;
    virtual void noSecret() const {
      cout << "Not a secret..." << endl;
    }
  protected:
    virtual void semiSecret() const {
      cout << "I am just quite a secret!" << endl;
    }
    virtual void semiSecret2() const {
      cout << "I am just quite a secret!" << endl;
    }
  private:
    virtual void secret() const {
      cout << "I am a secret!" << endl;
    }
};

class Sub : public Super {
  public:
    virtual void semiSecret() const override {
      cout << "From sub: semiSecret" << endl;
    }
    void printPrivate() const {
      semiSecret2();
    }
  protected:
    virtual void noSecret() const override {
      cout << "From sub: no I am quite secret" << endl;
    }
  private:
    virtual void semiSecret2() const override {
      cout << "From sub: Not quite, full secret here!" << endl;
    }
};


int main() {
  Super super;
  Sub sub;

  super.noSecret(); // Can only call the public method
  // sub.noSecrete(); // Can't access on derived class
  sub.semiSecret();

  Super& supsub = sub;

  // supsub.semiSecret(); // declared protected

  sub.printPrivate(); // declared protected

}
