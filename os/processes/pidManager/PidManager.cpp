#include <stdio.h>

#include "PidManager.h"

#define MIN_PID 300
#define MAX_PID 303

using namespace std;

PidManager::PidManager(/* args void*/)
{
  pointer = MIN_PID;
}

PidManager::~PidManager()
{
}

int PidManager::allocate_map()
{
  // for (int i = MIN_PID; i < MAX_PID; i++) {
  //   pidTable.insert(std::pair<int, bool>(i, false));
  // }
  return 1;
}

int PidManager::allocate_pid()
{
  int startPointer = pointer;
  while (pidTable.count(pointer) != 0) {
    pointer += 1;
    if (pointer > MAX_PID) pointer = MIN_PID;
    else if (startPointer == pointer) {
      printf("Table is full \n");
      return -1;
    }
  }
  pidTable.insert({ pointer, true });
  printf("Allocated PID: %d\n", pointer);
  return pointer;
}

int PidManager::release_pid(int pid)
{
  int result = pidTable.erase(pid);

  if (result == 1) {
    printf("Released PID: %d\n", pid);
  } else {
    printf("PID not found: %d\n", pid);
  }

  return result;
  return 1;
}