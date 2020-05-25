#include <unistd.h>
#include <sys/time.h>
#include <stdio.h>

int main(int argc, char** argv)
{
  int NUMPAGES = 1000;
  int jump = getpagesize() / sizeof(int);
  int extention = NUMPAGES * jump;
  int a[extention];

  struct timeval tv;
  time_t before, after;

  printf("Page size: %i\n", getpagesize());
  printf("Number of pages: %i\n", NUMPAGES);
  printf("Extention: %i\n", extention);

  double avg = 0.;
  int lastPos = 0;
  int loops = 0;

  for (int i = 0; i < extention; i += jump) {
    gettimeofday(&tv, NULL);
    before = tv.tv_sec * 1e6 + tv.tv_usec;
    a[i] = 1;
    gettimeofday(&tv, NULL);
    after = tv.tv_sec * 1e6 + tv.tv_usec;

    avg += (double)(after - before);
    lastPos = i;
    loops += 1;
  }

  printf("Last position: %i\n", lastPos);
  printf("Time value: %f\n", avg);
  printf("Loops: %i\n", loops);
  printf("Time avg: %f\n", avg / loops);
}
