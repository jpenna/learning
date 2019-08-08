#ifndef MOTHER_H
#define MOTHER_H

class Mother {
  public:
    Mother();
    ~Mother();
    void sayName();
    int publicv;
  protected:
    int protectedv;
  private:
    int privatev;
};

#endif
