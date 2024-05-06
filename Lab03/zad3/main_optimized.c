#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>

#define SIZE 2048 * 5

static inline uint64_t rdtsc() {
    unsigned int lo, hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((uint64_t)hi << 32) | lo;
}

int findMinInMatrix(register int **mat, register int n)
{
  int m = mat[0][0];
  for (register int i = 0; i < n; i++)
  {
    for (register int j = 0; j < n; j++)
    {
      m = mat[i][j] < m ? mat[i][j] : m;
    }
  }

  return m;
}

int findMaxInMatrix(register int **mat, register int n)
{
  int m = mat[0][0];
  for (register int i = 0; i < n; i++)
  {
    for (register int j = 0; j < n; j++)
    {
      m = mat[i][j] > m ? mat[i][j] : m;
    }
  }

  return m;
}

void fillMatrix(register int **mat, register int n)
{
  srand(time(NULL));
  for (register int i = 0; i < n; i++)
  {
    for (register int j = 0; j < n; j++)
    {
      mat[i][j] = rand();
    }
  }
}

int** allocMatrix(int n)
{
  int **m = (int**)malloc(n * sizeof(int*));
  for (int i = 0; i < n; i++)
  {
    *(m + i) = (int*)malloc(n * sizeof(int));
  }
  return m;
}

void freeMatrix(int**mat, int n)
{
  for (int i = 0; i < n; i++)
  {
    free(*(mat + i));
  }
  free(mat);
}

int main(int argc, char *argv[])
{
  uint64_t start, end;

  printf("allocating memory for matrix...");
  fflush(stdout);
  start = rdtsc();
  int **mat = allocMatrix(SIZE);
  end = rdtsc();
  printf(" ok (%lu cycles)\n", end - start);

  printf("filling matrix with random values...");
  fflush(stdout);
  start = rdtsc();
  fillMatrix(mat, SIZE);
  end = rdtsc();
  printf(" ok (%lu cycles)\n", end - start);

  printf("finding min value...\n");
  start = rdtsc();
  int minVal = findMinInMatrix(mat, SIZE);
  end = rdtsc();
  printf("min value: %d (%lu cycles)\n", minVal, end - start);

  printf("finding max value...\n");
  start = rdtsc();
  int maxVal = findMaxInMatrix(mat, SIZE);
  end = rdtsc();
  printf("max value: %d (%lu cycles)\n", maxVal, end - start);

  printf("freeing memory...");
  fflush(stdout);
  start = rdtsc();
  freeMatrix(mat, SIZE);
  end = rdtsc();
  printf(" ok (%lu cycles)\n", end - start);

  return EXIT_SUCCESS;
}
