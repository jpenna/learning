#include <iostream>
#include <string>

using namespace std;

template <class T>
class Go {
  public:
    Go(T x) {
      cout << x << " is not a char!" << endl;
    }

    Go(char x) {
      cout << x << " IS a char!" << endl;
    }
};

// SPECIALIZATION IS THIS
// template<>
// class Go<char> {
//   public:
//     Go(char x) {
//       cout << x << " IS a char!" << endl;
//     }
// };

void specialization() {
  Go<int> g1(123);
  Go<double> g2(123.15);
  Go<char> g3('a');
  Go<string> g4("STRING");


  Go g1(123);
  Go g2(123.15);
  Go g3('a');
  Go g4("STRING");
}
