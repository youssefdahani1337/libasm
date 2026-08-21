AS = nasm
ASFLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS = ft_strlen.s ft_write.s
OBJS = $(SRCS:.s=.o)
NAME = libasm.a

HEADER = libasm.h
TEST_SRC = main.c
TEST_BIN = test_asm

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

$(TEST_BIN): $(NAME) $(TEST_SRC) $(HEADER)
	$(CC) $(CFLAGS) $(TEST_SRC) -L. -lasm -o $(TEST_BIN)

test: $(TEST_BIN)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean re fclean test
