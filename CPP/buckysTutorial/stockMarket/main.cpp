#include <iostream>
#include <cmath>

int main() {
  float amount;
  float initial = 1000;
  float rate = .03;

  for (int day = 0; day <= 30; day++) {
    amount = initial * pow(1 + rate, day);
    std::cout << "Total amount for day " << day << " ------ " << amount << std::endl;
  }

  int x;
  std::cout << "Type a number\n";
  std::cin >> x;

  switch (x) {
    case 0:
      std::cout << "Poor!" << std::endl;
      break;
    default:
      std::cout << "rich!" << std::endl;
  }

}
