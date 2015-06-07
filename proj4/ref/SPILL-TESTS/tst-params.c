#include <stdio.h>

void f(int a, int b, int c, int d, int e,
       int f, int g, int h, int i, int j,
       int k, int l, int m, int n, int o) {
  printf("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
	 a,b,c,d,e,f,g,h,i,j,k,l,m,n,o);
}

int main()
{
  int a = 1, b = 2, c = 3, d = 4, e = 5,
      ff = 6, g = 7, h = 8, i = 9, j = 10,
      k =11, l =12, m =13, n =14, o = 15;
  f(a,b,c,d,e,ff,g,h,i,j,k,l,m,n,o);
}
