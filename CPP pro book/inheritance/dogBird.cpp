#include <iostream>
#include <typeinfo>

using namespace std;

class Animal {
  public:
    virtual ~Animal() = default;
    virtual void eat() const = 0;
    virtual void sleep() const {
      cout << "Animal sleeping" << endl;
    }
};

class Dog : public virtual Animal { // virtual inheritance
  public:
    virtual ~Dog() = default;
    virtual void eat() const override {
      cout << "Dog eating" << endl;
    }
};

class Bird : public virtual Animal {
  public:
    virtual ~Bird() = default;
    virtual void eat() const override {
      cout << "Bird eating" << endl;
    }
};

class DogBird : public Dog, public Bird {
  public:
    virtual ~DogBird() = default;
    virtual void eat() const override {
      cout << "DogBird eating" << endl;
    }
};




int main() {
  Dog dog;
  DogBird db;

  db.eat();
  db.sleep();

}
