#include <stdio.h>

int main(int argc, char **argv) {
  int x,y,z;
  int sum = 0;
  x = argc;
  while (x < 100) {
    sum += x;
    x++;
  }
  printf("sum: %d\n", sum);
}
