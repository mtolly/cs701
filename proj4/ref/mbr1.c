#include <stdio.h>

void foo(int a, int b, int* c, int op) {

  int answer;

  switch (op) {

    case 1:
      answer = a+b;
      break;
    case 2:
      answer = a-b;
      break;
    case 3:
      answer = a*b;
      break;
    case 4:
      answer = a*b+5;
      break;
    case 5:
      answer = a*b+6;
      break;
    case 6:
      answer = a*b+7;
      break;
    default:
      printf("invalid op\n");
      return;
  }

  *c = answer;  // all 6 assignments above to answer should reach here
  return;
}

int main() {

  int x,y,z;
  int ans;
  int a, b, op, answer;
  int* c;

  x = 34;
  y = 12;
  z = 3;

  foo(x,y,&ans,1);
  a = x; b = y; c = &ans; op = 1; 
  switch (op) {

    case 1:
      answer = a+b;
      break;
    case 2:
      answer = a-b;
      break;
    case 3:
      answer = a*b;
      break;
    case 4:
      answer = a*b+5;
      break;
    case 5:
      answer = a*b+6;
      break;
    case 6:
      answer = a*b+7;
      break;
    default:
      printf("invalid op\n");
  }
  *c = answer;  // all 6 assignments above to answer should reach here

 
  foo(z,5,&ans,2); 
  a = z; b = 5; op = 2; 
  switch (op) {

    case 1:
      answer = a+b;
      break;
    case 2:
      answer = a-b;
      break;
    case 3:
      answer = a*b;
      break;
    case 4:
      answer = a*b+5;
      break;
    case 5:
      answer = a*b+6;
      break;
    case 6:
      answer = a*b+7;
      break;
    default:
      printf("invalid op\n");
  }

  *c = answer;  // all 6 assignments above to answer should reach here


  z = 23;

  foo(z,x,&ans,3); 
  a = z; b = x; op = 3; 
  switch (op) {

    case 1:
      answer = a+b;
      break;
    case 2:
      answer = a-b;
      break;
    case 3:
      answer = a*b;
      break;
    case 4:
      answer = a*b+5;
      break;
    case 5:
      answer = a*b+6;
      break;
    case 6:
      answer = a*b+7;
      break;
    default:
      printf("invalid op\n");

  }

  *c = answer;  // all 6 assignments above to answer should reach here


  printf("ans: %d\n", ans);

  return ans;

}
