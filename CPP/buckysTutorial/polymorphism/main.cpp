#include <iostream>
#include <string>

using namespace std;

class Enemy {
  public:
    Enemy() : attackYell("xx") {};
    void attack();
    void setAttackPower(int a) { attackPower = a; };
    string attackYell;
  private:
    int attackPower;
};

void Enemy::attack() {
  cout << this->attackYell << " -- " << attackPower << endl;
}

class Ninja : public Enemy {
  public:
    Ninja() : attackYell("shhh...") {};
    void dodge() {
      cout << "The ninja dodged your attack!" << endl;
    }
  private:
    string attackYell;
};

class Monster : public Enemy {
  public:
    Monster() : attackYell("I am gonna eat you!") {};
  private:
    string attackYell;
};

int main() {
  Ninja n;
  Monster m;

  Enemy enemy1 = n;
  Enemy enemy2 = m;

  enemy1.setAttackPower(10);
  enemy2.setAttackPower(20);

  enemy1.attack();
  n.dodge();
  enemy2.attack();
}
