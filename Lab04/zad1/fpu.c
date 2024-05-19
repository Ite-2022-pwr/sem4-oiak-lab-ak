#include <stdio.h>

unsigned short get_fpu();
void set_fpu(unsigned short cw);


typedef struct 
{
  unsigned short invalid_operation : 1;       // bit 0
  unsigned short denormal_operand : 1;        // bit 1   
  unsigned short zero_divide_exception : 1;   // bit 2
  unsigned short overflow_exception : 1;      // bit 3
  unsigned short underflow_exception : 1;     // bit 4
  unsigned short precision_exception : 1;     // bit 5
  // exceptions

  unsigned short reserved2 : 2;               // bits 6 - 7
  unsigned short precision_control : 2;       // bits 8 - 9
  unsigned short rounding_control : 2;        // bits 10 - 11
  unsigned short infinity_control : 1;        // bit 12
  unsigned short reserved1 : 3;               // bits 13 - 15
} fpu_mask_t;

void print_fpu(unsigned short fpu)
{
  union
  {
    unsigned short fpu;
    fpu_mask_t fpu_mask;
  } fpu_union;

  fpu_union.fpu = fpu;
  fpu_mask_t *fpu_mask = &fpu_union.fpu_mask;

  printf("Value:\t\t\t\t0x%04x\n", fpu);
  // printf("Reserved:\t\t\t%d\n", fpu_mask->reserved1);
  printf("Infinity control:\t\t%d\n", fpu_mask->infinity_control);
  printf("Rounding control:\t\t%d\n", fpu_mask->rounding_control);
  printf("Precision control:\t\t%d\n\n", fpu_mask->precision_control);
  // printf("Reserved:\t\t\t%d\n", fpu_mask->reserved2);
  printf("Precision exception:\t\t%d\n", fpu_mask->precision_exception);
  printf("Underflow exception:\t\t%d\n", fpu_mask->underflow_exception);
  printf("Overflow exception:\t\t%d\n", fpu_mask->overflow_exception);
  printf("Zero division exception:\t%d\n", fpu_mask->zero_divide_exception);
  printf("Denormal operand exception:\t%d\n", fpu_mask->denormal_operand);
  printf("Invalid operation:\t\t%d\n\n", fpu_mask->invalid_operation);
}

int main(int argc, char *argv[])
{
  unsigned short fpu = get_fpu();
  print_fpu(fpu);

  fpu = 0x007f;
  printf("Setting FPU to 0x%04x\n\n", fpu);
  set_fpu(fpu);

  fpu = get_fpu();
  print_fpu(fpu);

  fpu = 0x037f;
  printf("Setting FPU to 0x%04x\n\n", fpu);
  set_fpu(fpu);

  fpu = get_fpu();
  print_fpu(fpu);

  return 0;
}
