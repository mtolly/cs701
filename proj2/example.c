#include <stdio.h>
void foo(int x) {
  int y;
  scanf("%d", &y);
  x = y / 3; // useless
}

int main() {
  int a, b, c;
  scanf("%d", &a);  // force a to be stored in memory not a register
  b = a * 2;        // useless
  c = a + 4;        // useless
  foo(a);
  c = a * 6;
  printf("c: %d\n", c);
}
