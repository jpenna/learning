#include <string>

using namespace std;

class Ticket {
  public:
    Ticket();
    ~Ticket();
    void setPassangerName(const string&);
    const string& getPassangerName() const;
    bool isVIP() const;
    void setVIP(bool);
    int calculateTicketCost() const;
    void setMiles(int);
    void printInfo() const;
  private:
    string passangerName;
    bool vip;
    int miles;
};

// auto main() -> int
// {
//   // Using reference <heap>
//   auto ticket2 = make_unique<Ticket>();
//   ticket2->setVIP(false);
//   ticket2->setPassangerName("Adriano Pedro");
//   ticket2->setMiles(2300);
//   ticket2->calculateTicketCost();
//   ticket2->printInfo();

//   cout << endl;

//   // Using naked pointer <heap>
//   Ticket* ticket1 = new Ticket();
//   ticket1->setVIP(true);
//   ticket1->setPassangerName("Jorge Augusto");
//   ticket1->setMiles(900);
//   ticket1->calculateTicketCost();
//   ticket1->printInfo();
//   delete ticket1; // has to delete

//   cout << endl;

//   // Using type <stack-based>
//   Ticket ticket3;
//   ticket3.setVIP(true);
//   ticket3.setPassangerName("Armando Jr.");
//   ticket3.setMiles(500);
//   ticket3.calculateTicketCost();
//   ticket3.printInfo();


//   return 0;
// }
