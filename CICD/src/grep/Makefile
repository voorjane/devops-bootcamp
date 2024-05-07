CC=gcc
CFLAGS=-Wall -Wextra -Werror
COLOR_G=\033[32m
COLOR_END=\033[0m

.PHONY: all clean rebuild clang leaks

all: s21_grep

s21_grep: s21_grep.o
	$(CC) -o s21_grep s21_grep.o
	@echo "$(COLOR_G)Done!$(COLOR_END)"

s21_grep.o: s21_grep.c
	@echo "$(COLOR_G)Building...$(COLOR_END)"
	$(CC) $(CFLAGS) -c s21_grep.c

clang:
	@cp ../../materials/linters/.clang-format .
	clang-format -n s21_grep.c s21_grep.h
	@echo "$(COLOR_G)Done$(COLOR_END)"
	@rm .clang-format

clean:
	rm -rf s21_grep *.o
	@echo "$(COLOR_G)Cleaning done!$(COLOR_END)"

rebuild:
	@echo "$(COLOR_G)Rebuilding...$(COLOR_END)"
	$(MAKE) clean
	$(MAKE) all
