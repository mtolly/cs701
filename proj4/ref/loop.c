#include <stdlib.h>
#include <stdio.h>

int global_array[5] = {10, 20, 30, 40, 50};
int global_size = 6;

void print_array(int *array, int size) {
  while (size > 0) {
    printf("%d ", array[size-1]);
    size--;
  }
  printf("\n");
}


void add_array(int *array, int size) {
  int i;
  size = 5;
  global_size = 5;
  for(i=0; i<size; i++)
    array[i] = array[i] + global_array[i];
}

int sum_array(int *array, int size) {
  int sum = 0;
  int i = 0;
  for(i=0; i<size;i++) 
    sum += array[i];
  return sum;
}



int main() {
  int *array;
  int sum;
  int NO;
  int i;
  int size;

  array = (int *) calloc(5, sizeof(int));
  NO=2;

  sum = sum_array(array, 5);
  sum = 0;
  i = 0;
  for(i=0; i<5;i++) 
    sum += array[i];

  add_array(array, 5);
  /* overwriting value of parameter so parameter is dead */
  i = 0;
  size = 5;
  global_size = 5;
  for(i=0; i<size; i++)
    array[i] = array[i] + global_array[i];


  print_array(array, 5);
  while (size > 0) {
    printf("%d ", array[size-1]);
    size--;
  }
  printf("\n");

  /* tests CFGs that have nodes that cannot be reached from
     anywhere in the code */
  sum=0;
 label1:
  sum+=2;
  goto label2;
  sum=sum+NO;
  
 label2:
  sum--;
  if(sum==100)
    goto label3;
  goto label1;
 label3:

  sum++;
  return sum;
}







