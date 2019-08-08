#include <iostream>
#include "database.h"
#include "employee.h"

using namespace std;

namespace Records {
  Database::Database() {
    // Nothing
  };

  Database::~Database() {
    cout << "Firing all employees!" << endl;
  };

  int Database::addEmployee(Employee& employee) {
    int lastNum = employeeList.size() + 1;
    employee.setNumber(lastNum);
    employeeList.push_back(employee);
    return lastNum;
  };

  const Employee Database::fireEmployee(int num) {
    Employee& employee = getEmployee(num);
    employee.setHired(false);
    return employee;
  };

  const Employee Database::promoteEmployee(int num, string job) {
    Employee& employee = getEmployee(num);
    employee.setJob(job);
    return employee;
  };

  Employee& Database::getEmployee(int num) {
    for (auto& emp : employeeList) {
      if (emp.getNumber() == num) return emp;
    }
    throw runtime_error("No employee found.");
  };

  const vector<Employee>& Database::getEmployeeList() const {
    return employeeList;
  };
}
