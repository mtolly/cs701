/* CAUSES UNREACHABLE executed error */

#include <stdio.h>

int main(int argc, char **argv) {
  int a, b, c, x, y, z;
  x = argc+1000;
  printf("x: %d\n", x);
  while (x > 1000) x = x/1000;
  printf("x: %d\n", x);
  y = x + 5;
  z = x * 2 - 1;
  a = x+y*z;
  b = a/x - (5+y);
  c = a+b+x+y+z;
  printf("a: %d\nb: %d\nc: %d\nx: %d\ny: %d\nz: %d\n", a,b,c,x,y,z);
}
