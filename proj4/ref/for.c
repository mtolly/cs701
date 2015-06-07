#include <stdio.h>

int main(int argc, char **argv) {
  int x,y,z;
  int sum = 0;
  x = argc;
  for (; x<100; x++) {
    sum += x;
  }
  printf("sum: %d\n", sum);
}
