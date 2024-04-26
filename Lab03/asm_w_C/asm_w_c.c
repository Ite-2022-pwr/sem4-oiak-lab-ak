#include <stdio.h>

extern int mulInt(int a, int b);
extern float addFloat(float a, float b);
extern float sumFloat(float *a, int n);

int main(int argc, char *argv[])
{
  printf("%d\n", mulInt(2, 3));
  printf("%.3f\n", addFloat(3.14, 4.20));
  float af[4] = {21.37, 6.9, 4.20, 1.681}; 
  printf("%.3f\n", sumFloat(af, 4));
  return 0;
}
