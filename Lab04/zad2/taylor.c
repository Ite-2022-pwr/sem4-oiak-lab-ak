#include <math.h>
#include <stdio.h>

#define EPSILON 1e-15

double factorial(double n)
{
  double result = 1.0;

  for (int i = 2; i <= n; i++)
  {
    result *= i;
  }

  return result;
}

double sinTaylor(double x)
{
  int k = 0;
  double sign = 1.0;
  double result = 0.0;
  double term;

  do
  {
    term = sign * pow(x, 2 * k + 1);
    term /= factorial(2 * k + 1);
    k++;
    sign = -sign;
    result += term;
  }
  while (fabs(term) > EPSILON);

  return result;
}

double cosTaylor(double x)
{
  int k = 0;
  double sign = 1.0;
  double result = 0.0;
  double term;

  do
  {
    term = sign * pow(x, 2 * k);
    term /= factorial(2 * k);
    k++;
    sign = -sign;
    result += term;
  }
  while (fabs(term) > EPSILON);

  return result;
}

int main(int argc, char *argv[])
{
  printf("sin(%0.3lf) = %lf\n", M_PI, sinTaylor(M_PI));
  printf("sin(%0.3lf) = %lf\n", M_PI / 2.0, sinTaylor(M_PI / 2.0));
  printf("sin(%0.3lf) = %lf\n", M_PI / 4.0, sinTaylor(M_PI / 4.0));

  printf("\n");

  printf("cos(%0.3lf) = %lf\n", M_PI, cosTaylor(M_PI));
  printf("cos(%0.3lf) = %lf\n", M_PI / 2.0, cosTaylor(M_PI / 2.0));
  printf("cos(%0.3lf) = %lf\n", M_PI / 4.0, cosTaylor(M_PI / 4.0));

  return 0;
}
