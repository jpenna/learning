#include <string>
#include <iostream>
#include <vector>
#include "interface.h"
#include "employee.h"
#include "database.h"

using namespace std;

namespace Records {
  Interface::Interface(Database db)
  {
    database = db;
    welcome();
    start();
  }

  Interface::~Interface()
  {
    cout << "Closing the company..." << endl;
  }

  void Interface::welcome()
  {
    cout << "Welcome, Employer!" << endl;
  }

  void Interface::start()
  {
    string options[] = {
      "1 - Add employee",
      "2 - Fire employee",
      "3 - Promote employee",
      "4 - List all employees",
      "5 - List current employees",
      "6 - List former employees",
    };

    cout << "\nTell me, what you want to do?" << endl;

    for (const string& option : options) {
      cout << option << endl;
    }

    int selected = 0;

    cin >> selected;

    switch (selected)
    {
      case 1:
        newEmployee();
        break;
      case 2:
        fireEmployee();
        break;
      case 3:
        promoteEmployee();
        break;
      case 4:
        listAllEmployees();
        break;
      case 5:
        listCurrentEmployees();
        break;
      case 6:
        listFormerEmployees();
        break;
      default:
        cout << "This option is not valid. Try again" << endl;
        break;
    }

    start();
  }


  void Interface::newEmployee()
  {
    Employee employee;
    cout << "NEW EMPLOYEE INFO" << endl;

    try {
      cout << "Name: ";
      string name;
      cin >> name;
      employee.setName(name);

      cout << "Age: ";
      int age;
      cin >> age;
      employee.setAge(age);

      cout << "Job: ";
      string job;
      cin >> job;
      employee.setJob(job);

      cout << "Salary: ";
      int salary;
      cin >> salary;
      employee.setSalary(salary);

      database.addEmployee(employee);
      cout << "\nAdded new employee" << endl;
      employee.print();

    } catch (const exception& exc) {
      cout << "Something went wrong: " << exc.what() << endl;
      cout << "Try again" << endl;
      newEmployee();
    }
  };

  void Interface::fireEmployee()
  {
    cout << "\nWhich employee do you want to FIRE (employee #)? [0 to return]" << endl;
    int num = 0;
    cin >> num;

    if (!num) return;

    try {
      Employee employee = database.fireEmployee(num);
      cout << "Employee Fired" << endl;
      employee.print();
    } catch (const exception& exception) {
      cout << "Could not fire employee. Check if number exist: " << num << endl;
    }
  };

  void Interface::promoteEmployee()
  {
    cout << "\nWhich employee do you want to PROMOTE (employee #)? [0 to return]" << endl;
    int num = 0;
    cin >> num;

    if (!num) return;

    try {
      cout << "\nWhat is the new job? [0 to return]" << endl;
      string job;
      cin >> job;

      if (job == "0") return;

      Employee employee = database.promoteEmployee(num, job);

      cout << "Employee Promoted to " << job << endl;
      employee.print();
    } catch (const exception& exception) {
      cout << "Could not fire employee. Check if number exist: " << num << endl;
    }
  };

  void Interface::listAllEmployees()
  {
    cout << "Listing ALL employees" << endl;

    vector<Employee> employeeList = database.getEmployeeList();

    for (const Employee& employee : employeeList) {
      employee.print();
    }

    cout << endl;
  };

  void Interface::listCurrentEmployees()
  {
    cout << "Listing CURRENT employees" << endl;

    vector<Employee> employeeList = database.getEmployeeList();

    for (const Employee& employee : employeeList) {
      if (employee.getHired()) employee.print();
    }

    cout << endl;
  };

  void Interface::listFormerEmployees()
  {
    cout << "Listing FORMER employees" << endl;

    vector<Employee> employeeList = database.getEmployeeList();

    for (const Employee& employee : employeeList) {
      if (!employee.getHired()) employee.print();
    }

    cout << endl;
  };
}
