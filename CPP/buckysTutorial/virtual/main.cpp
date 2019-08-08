#include <iostream>
#include <string>

using namespace std;

class Enemy {
  public:
    virtual void attack() = 0; // pure virtual function, has to overwrite
    virtual void dodge() {
      cout << "Enemy tryed to dodge, but didn't have success!" << endl;
    }
};

class Ninja: public Enemy {
  public:
    void attack() {
      cout << "Ninja attack!" << endl;
    }
    virtual void dodge() {
      cout << "Ninja dodged your attack!" << endl;
    }
};

class Monster: public Enemy {
  public:
    void attack() {
      cout << "Monster attack!" << endl;
    }
};

int main() {
  Ninja n;
  Monster m;

  Enemy *enemy1 = &n;
  Enemy *enemy2 = &m;

  enemy1->attack();
  enemy2->attack();

  enemy1->dodge();
  enemy2->dodge();
}
