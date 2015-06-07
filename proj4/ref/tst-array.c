#include <stdlib.h>
#include <stdio.h>

int main() {
  int *array;
  int sum;
  int NO;
  int i;
  int size;

  int global_array[5] = {10, 20, 30, 40, 50};
  int global_size = 6;

  array = (int *) calloc(5, sizeof(int));
  NO=2;

  sum = 0;
  i = 0;
  for(i=0; i<5;i++) 
    array[i] = i;

  i = 0;
  size = 5;
  global_size = 5;
  while(i<size) {
    array[i] = array[i] + global_array[i];
    i++;
  }

  size--;
  while (size >= 0) {
    printf("%d ", array[size]);
    size--;
  }
  printf("\n");
  return sum;
}
