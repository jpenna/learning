#pragma once
#include <string>

using namespace std;

namespace Records {
  const int startingSalary = 30'000;

  class Employee
  {
    public:
      Employee();
      // Getters
      const string& getName() const;
      int getNumber() const;
      int getSalary() const;
      int getAge() const;
      bool getHired() const;
      const string& getJob() const;
      // Setters
      void setName(const string&);
      void setNumber(int);
      void setSalary(int);
      void setAge(int);
      void setHired(bool);
      void setJob(const string&);

      void print() const;
    private:
      string name;
      int number;
      unsigned int salary = startingSalary;
      int age;
      bool hired;
      string job;
  };

}
