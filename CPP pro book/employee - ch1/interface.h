#pragma once
#include "employee.h"
#include "database.h"

namespace Records {
  class Interface
  {
    public:
      Interface(Database);
      ~Interface();
    private:
      Employee selectedEmployee;
      Database database;
      void welcome();
      void start();
      void newEmployee();
      void fireEmployee();
      void promoteEmployee();
      void listAllEmployees();
      void listCurrentEmployees();
      void listFormerEmployees();
  };
}
