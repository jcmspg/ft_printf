# Name of the library
NAME = libftprintf.a

# Compiler
CC = cc

# Directory containing the source files
SRC_DIR = .

# Compiler flags
CFLAGS = -Wall -Wextra -Werror

# Source files to be compiled into objects
SRCS = ft_atoi.c ft_isdigit.c ft_itoa_base.c ft_nbrlen.c ft_parse_data.c ft_parse_wrapper.c \
    ft_print_char.c ft_print_id.c ft_print_padding.c ft_print_percent.c ft_print_ptr.c ft_print_str.c \
    ft_print_u.c ft_print_xx.c ft_printf.c ft_strchr.c ft_strlen.c ft_write_nbr.c ft_write_str.c \
    ft_write.c ft_print_type.c ft_to_uppers.c ft_aux.c

BONUS_SRCS = 

# Object files generated from source files
OBJS = $(SRCS:%.c=$(SRC_DIR)/%.o)
BONUS_OBJS = $(BONUS_SRCS:%.c=$(SRC_DIR)/%.o)

# Directory containing header files
INC_DIR = .

# Rule to compile individual source files into object files
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to create the target library
$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

# Rule to build the library
all: $(NAME)

# Rule to build the library with bonus
bonus: $(BONUS_OBJS)
	@ar rc $(NAME) $(BONUS_OBJS)
	@ranlib $(NAME)

# Rule to remove object files
clean:
	@rm -f $(OBJS)

# Rule to remove object files and the target library
fclean: clean
	@rm -f $(NAME)

# Rule to perform a full rebuild
re: fclean all

# Default target
.DEFAULT_GOAL := all

# PHONY
.PHONY: all clean fclean re

# End of Makefile
