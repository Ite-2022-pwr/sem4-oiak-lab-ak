int addInt(int a, int b)
{
  return a + b;
}

float mulFloat(float a, float b)
{
  return a * b;
}

int findMin(int *a, int n)
{
  int mini = *a;
  for (int i = 1; i < n; i++)
  {
    if (*(a + i) < mini)
    {
      mini = *(a + i);
    }
  }

  return mini;
}
