#include "s21_cat.h"

void parser(int argc, char **argv, flags *flag) {
  int opt = 0;

  struct option options[] = {{"number-nonblank", 0, 0, 'b'},
                             {"number", 0, 0, 'n'},
                             {"squeeze-blank", 0, 0, 's'}};

  while ((opt = getopt_long(argc, argv, "+benstvET", options, NULL)) != -1) {
    switch (opt) {
      case 'b':
        flag->b = 1;
        break;
      case 'e':
        flag->e = 1;
        flag->v = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 't':
        flag->t = 1;
        flag->v = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'E':
        flag->e = 1;
        break;
      case 'T':
        flag->t = 1;
        break;
      default:
        exit(EXIT_FAILURE);
    }
    if (flag->b && flag->n) flag->n = 0;
  }
}

void reader(char **argv, flags *flag) {
  FILE *file = fopen(argv[optind], "r");

  if (file != NULL) {
    flags_output(file, flag);
    fclose(file);
  } else {
    fprintf(stderr, "cat: %s: No such file or directory\n", argv[optind]);
  }
}

int flagV(int ch) {
  if ((ch >= 0 && ch < 9) || (ch > 10 && ch < 32) || (ch > 126 && ch <= 160)) {
    printf("^");
    if (ch > 126) {
      ch -= 64;
    } else {
      ch += 64;
    }
  }
  return ch;
}

void flagE(char ch) {
  if (ch == '\n') printf("$");
}

int flagT(int ch) {
  if (ch == '\t') {
    printf("^");
    ch = 'I';
  }
  return ch;
}

int flagS(char ch, char last, int empty_str_count) {
  if (ch == '\n' && last == '\n') {
    empty_str_count++;
  } else {
    empty_str_count = 0;
  }
  return empty_str_count;
}

int flagB(char ch, char last, int str_count) {
  if (last == '\n' && ch != '\n') {
    printf("%6d\t", ++str_count);
  }
  return str_count;
}

int flagN(char last, int str_count) {
  if (last == '\n') {
    printf("%6d\t", ++str_count);
  }
  return str_count;
}

void flags_output(FILE *file, flags *flag) {
  int last = '\n', str_count = 0, empty_str_count = 0;

  while (!feof(file)) {
    int ch = fgetc(file);

    if (ch == EOF) break;
    if (flag->s) {
      if ((empty_str_count = flagS(ch, last, empty_str_count)) > 1) continue;
    }
    if (flag->b) {
      str_count = flagB(ch, last, str_count);
    }
    if (flag->n) {
      str_count = flagN(last, str_count);
    }
    if (flag->t) {
      ch = flagT(ch);
    }
    if (flag->e) {
      flagE(ch);
    }
    if (flag->v) {
      ch = flagV(ch);
    }
    printf("%c", ch);
    last = ch;
  }
}
