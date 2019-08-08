#pragma once
#include <vector>
#include "employee.h"

namespace Records {
  class Database {
    public:
      Database();
      ~Database();
      int addEmployee(Employee&);
      Employee& getEmployee(int);
      const Employee fireEmployee(int);
      const Employee promoteEmployee(int, string);
      const vector<Employee>& getEmployeeList() const;
    private:
      vector<Employee> employeeList;
      bool updateEmployee(const Employee&);
  };
}
