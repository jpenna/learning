#include "PidManager.h"

int main() {
  PidManager pidManager;

  pidManager.allocate_map();

  int pid1 = pidManager.allocate_pid();
  int pid2 = pidManager.allocate_pid();
  int pid3 = pidManager.allocate_pid();
  int pid4 = pidManager.allocate_pid();
  int pid5 = pidManager.allocate_pid();
  int pid6 = pidManager.allocate_pid();

  int res1 = pidManager.release_pid(pid2);
  int res2 = pidManager.release_pid(pid2);

  int pid7 = pidManager.allocate_pid();


}