#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct flag {
  int b, e, n, s, t, v;
} flags;

void flagE(char ch);
void parser(int argc, char **argv, flags *flag);
void reader(char **argv, flags *flag);
void flags_output(FILE *file, flags *flag);
int flagV(int ch);
int flagT(int ch);
int flagS(char ch, char last, int empty_str_count);
int flagB(char ch, char last, int str_count);
int flagN(char last, int str_count);

#endif  //  SRC_CAT_S21_CAT_H_
