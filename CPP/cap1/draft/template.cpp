#include <iostream>
#include <vector>
#include <string>
#include <stdexcept>
#include <cstdlib>

template <class T>
class Stack {
  private:
    std::vector<T> elems;

  public:
    void push(T const&);
    void pop();
    T top() const;

    bool empty() const {
      return elems.empty();
    }
};

template <class T>
void Stack<T>::push (T const& elem) {
  elems.push_back(elem);
}

template <class T>
void Stack<T>::pop () {
  if (elems.empty()) {
    throw std::out_of_range("Stack<>::pop(): empty stack");
  }
  elems.pop_back();
}

template <class T>
T Stack<T>::top () const {
  if (elems.empty()) {
    throw out_of_range("Stack<>::pop(): empty stack");
  }
  elems.back();
}


int main() {
  try {
    Stack<int> intStack;
    Stack<std::string> stringStack;

    intStack.push(7);
    return 0;
  } catch (std::exception const& ex) {
    std::cerr << "Exception: " << ex.what() << std::endl;
    return -1;
  }
}
