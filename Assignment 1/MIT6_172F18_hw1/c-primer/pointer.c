// Copyright (c) 2012 MIT License by 6.172 Staff

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(int argc, char * argv[]) {  // What is the type of argv? Sequence of pointer to the type "char".
  int i = 5;
  // The & operator here gets the address of i and stores it into pi
  int * pi = &i;
  // The * operator here dereferences pi and stores the value -- 5 --
  // into j.
  int j = *pi;

  char c[] = "6.172";
  char * pc = c;  // Valid assignment: c acts like a pointer to c[0] here.
  char d = *pc;
  printf("char d = %c\n", d);  // What does this print? char d = 6

  // compound types are read right to left in C.
  // pcp is a pointer to a pointer to a char, meaning that
  // pcp stores the address of a char pointer.
  char ** pcp;
  pcp = argv;  // Why is this assignment valid? Because argv is a sequence of pointer to the type "char", and sequence can also be regarded as a kind of "pointer".

  const char * pcc = c;  // pcc is a pointer to char constant
  char const * pcc2 = c;  // What is the type of pcc2? A pointer to the type char constant.

  // For each of the following, why is the assignment:
  *pcc = '7';  // invalid? It's invalid because *pcc is the char variable pcc pointing to, which is constant. So, the value of *pcc cannot be verified.
  pcc = *pcp;  // valid? It's valid because pcc is a pointer to type "char" and pcc itself is not constant. On the other hand, '*pcp' is the first entry of argv, a sequence of pointer to the type "char", which means that pcp is also a pointer to "char". So, the value of pcc can be changed to that of *pcp.
  pcc = argv[0];  // valid? It's valid because pcc is a pointer to type "char" and pcc itself is not constant. On the other hand, 'argv[0]' is the first entry of argv, a sequence of pointer to the type "char", which means that argv[0] is also a pointer to "char". So, the value of pcc can be changed to that of argv[0].

  char * const cp = c;  // cp is a const pointer to char
  // For each of the following, why is the assignment:
  cp = *pcp;  // invalid? It's invalid because cp is constant and it's value cannot be changed.
  cp = *argv;  // invalid? It's invalid because cp is constant and it's value cannot be changed.
  *cp = '!';  // valid? It's valid because *cp is the char variable cp pointing to, which is not constant. So, the value of *cp can be changed.

  const char * const cpc = c;  // cpc is a const pointer to char const
  // For each of the following, why is the assignment:
  cpc = *pcp;  // invalid? It's invalid because cpc is constant and it's value cannot be changed..
  cpc = argv[0];  // invalid? It's invalid because cpc is constant and it's value cannot be changed..
  *cpc = '@';  // invalid? It's invalid because *cpc is the char variable cpc pointing to, which is also constant. So, the value of *cpc cannot be changed.

  return 0;
}
