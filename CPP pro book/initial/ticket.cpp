#include "ticket.h"
#include <iostream>

Ticket::Ticket() {
  miles = 0;
  passangerName = "Unknown";
  vip = false;
}

Ticket::~Ticket() {
  // Nothing to do
}

void Ticket::setPassangerName(const string& name) {
  passangerName = name;
}

void Ticket::setMiles(int m) {
  miles = m;
}

void Ticket::setVIP(bool v) {
  vip = v;
}

const string& Ticket::getPassangerName() const {
  return passangerName;
}

bool Ticket::isVIP() const {
  return vip;
}

int Ticket::calculateTicketCost() const {
  if (vip) return static_cast<int>(miles * 0.5);
  return static_cast<int>(miles * 1.1);
}

void Ticket::printInfo() const {
  std::cout
    << "Name: " << passangerName << std::endl
    << "VIP: " << (vip ? "Yes" : "No") << std::endl
    << "Miles: " << miles << std::endl
    << "Cost: USD " << calculateTicketCost() << std::endl;
}
