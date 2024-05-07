CC=gcc
CFLAGS=-Wall -Wextra -Werror -std=c11
COLOR_G=\033[32m
COLOR_END=\033[0m

.PHONY: all clean rebuild clang leaks

all: s21_cat

s21_cat: s21_cat.o main.o
	$(CC) -o s21_cat s21_cat.o main.o
	@echo "$(COLOR_G)Done!$(COLOR_END)"

s21_cat.o: s21_cat.c
	@echo "$(COLOR_G)Building...$(COLOR_END)"
	$(CC) $(CFLAGS) -c s21_cat.c

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clang:
	@cp ../../materials/linters/.clang-format .
	clang-format -n s21_cat.c s21_cat.h main.c
	@echo "$(COLOR_G)Done$(COLOR_END)"
	@rm .clang-format

clean:
	rm -rf s21_cat *.o
	@echo "$(COLOR_G)Cleaning done!$(COLOR_END)"

rebuild:
	@echo "$(COLOR_G)Rebuilding...$(COLOR_END)"
	$(MAKE) clean
	$(MAKE) all
