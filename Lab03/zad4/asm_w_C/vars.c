#include <stdio.h>

extern char byteArray[];
extern int integer;
extern const float PI;

int main(int argc, char *argv[])
{
  printf("%d\n", integer);
  printf("%s\n", byteArray);
  integer = 420;  // zmienna
  printf("%d\n", integer);

  printf("%.2f\n", PI); // stała

  return 0;
}
