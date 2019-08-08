#include <iostream>
#include <sstream>

using namespace std;

class Book
{
  public:
    virtual ~Book() = default;
    virtual string getDescription() const {
      stringstream ss;
      ss << "Book (" << getPages() << ")";
      return ss.str();
    };
    virtual int getHeight() const {
      return 100;
    };
    static void printStatic(string s = "ARG") {
      cout << "Print Book Static " << s << endl;
    };
    virtual void printVirtual(string s = "ARG") {
      cout << "Print Book Virtual " << s << endl;
    };

  private:
    virtual string getPages() const { return "30"; };
};

class Paperback : public Book
{
  public:
    virtual ~Paperback() = default;
    virtual string getDescription() const override {
      stringstream height;
      height << getHeight();
      return "Paperback "  + Book::getDescription() + " (" + height.str() + "cm)";
    };
};

class Novel : public Paperback
{
  public:
    Novel(string name = "No name") {
      mName = name;
    };
    virtual string getDescription() const {
      return Paperback::getDescription() + " Novel: " + mName;
    };
    int getHeight() const override {
      return Paperback::getHeight() / 2;
    }
  private:
    string mName;
    string getPages() const override { return "450"; };
};

class Technical : public Paperback
{
  public:
    Technical(string name = "No name") {
      mName = name;
    }
    virtual string getDescription() const {
      return Paperback::getDescription() + " Technical: " + mName;
    };
    static void printStatic(string s = "arg") {
      cout << "Print Technical Static " << s << endl;
    };
    void printVirtual(string s = "arg") override {
      cout << "Print Technical Virtual " << s << endl;
    };
  private:
    string mName;
};

int main()
{
  Book book;
  Novel novel("Tom Saywer");
  Technical technical("Computer");
  cout << novel.getDescription() << endl;
  cout << technical.getDescription() << endl;

  Book::printStatic();
  Technical::printStatic();
  Book& pBook = technical;
  technical.printStatic();
  pBook.printStatic(); // print from Book

  cout << endl;

  book.printVirtual();
  technical.printVirtual();
  pBook.printVirtual(); // print from Book

}
