#include "employee.h"
#include <string>
#include <iostream>

using namespace std;

namespace Records {
  Employee::Employee()
    : name("Unknown")
    , age(0)
    , number(0)
    , job("Unknown")
    , hired(true)
  {

  }

  const string& Employee::getName() const {
    return name;
  };
  int Employee::getNumber() const {
  return number;
  };
  int Employee::getSalary() const {
    return salary;
  };
  int Employee::getAge() const {
    return age;
  };
  bool Employee::getHired() const {
    return hired;
  };
  const string& Employee::getJob() const {
    return job;
  };

  // Setters

  void Employee::setName(const string& n)
  {
    name = n;
  };
  void Employee::setNumber(int n)
  {
    number = n;
  };
  void Employee::setSalary(int s)
  {
    salary = s;
  };
  void Employee::setAge(int a)
  {
    age = a;
  };
  void Employee::setHired(bool h)
  {
    hired = h;
  };
  void Employee::setJob(const string& j)
  {
    job = j;
  };

  void Employee::print() const {
    cout << "#" << getNumber() << "  | " << (getHired() ? "CURRENT " : "FIRED ") << getName() << " (" << getAge() << "): " << getJob() << " - USD " << getSalary() << endl;
  }
}
