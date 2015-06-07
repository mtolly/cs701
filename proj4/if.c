#include <stdio.h>

int main(int argc, char **argv) {
  int x,y,z;
  x = argc;
  printf("x: %d\n", x);
  y = x/2;
  if (y>0) {
    y = y + 5;
    z = y * 2 - 1;
  } else {
    if (y <0) {
      y = y * 5;
    }
    z = y * 2 - 1;
    y++;
    z--;
  }
  printf("y: %d\nz: %d\n", y,z);
}
