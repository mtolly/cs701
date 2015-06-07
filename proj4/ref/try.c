#include <stdio.h>

int abc(int a, int b, int c, double d, double e){
  if(a < b || c < d || d < e){
    while(a<b)
      a++;
    b++;
    while(c<d)
      c++;
    d++;
    e++;
  }
  printf("%d %d %d %f %f\n", a, b, c, d, e);
  return a;
}

int main(){
  int a = 3;
  int b = 4;
  int c = 5;
  int d = 6;
  double e = 7.0;
  int flag = 0;
  while(!flag){
    if(a < e){
      a++;
      d+=e;
      c += abc(a, b, c, d, e);
    }
    else{
      b++;
      flag = 1;
    }
  }
  int x = e - a;
  int y = d + b;
  int z = c * a;
  
  printf("%d %d %d %f %f %d %d %d\n", a, b, c, d, e, x, y, z);
  
}
