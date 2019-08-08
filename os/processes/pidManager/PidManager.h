#ifndef PID_MANAGER
#define PID_MANAGER

#include <map>

using namespace std;

class PidManager
{
  private:
    map<int, bool> pidTable;
    int pointer;
    
  public:
    PidManager(/* args */);
    ~PidManager();

    int allocate_map();
    int allocate_pid();
    int release_pid(int);
};

#endif
