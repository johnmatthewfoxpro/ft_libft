# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfox <jfox.42angouleme@gmail.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/12/30 17:04:58 by jfox              #+#    #+#              #
#    Updated: 2025/12/30 17:46:06 by jfox             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

OBJECT_DIR ?= ./object_files
SRC_DIR = ./src
INC_DIR = ./header

SRCC = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
       ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c \
       ft_memcmp.c ft_memcpy.c ft_memset.c ft_memmove.c ft_putchar_fd.c \
       ft_putendl_fd.c ft_putstr_fd.c ft_putnbr_fd.c ft_split.c ft_strchr.c \
       ft_strtrim.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
       ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c \
       ft_strrchr.c ft_substr.c ft_toupper.c ft_tolower.c get_next_line.c \
       ft_printf.c ft_printf_putchar_fd.c ft_printf_putnbr_fd.c \
       ft_printf_pvoid.c ft_printf_putnbr_unsigned_fd.c \
       ft_printf_putnbr_hex_fd.c ft_printf_putstr_fd.c

OFILES = $(SRCC:%.c=$(OBJECT_DIR)/%.o)
CC = cc
CFLAGS += -Wall -Wextra -Werror -g -I$(INC_DIR) -MMD -MP
NAME = libft.a

all: $(NAME)

$(OBJECT_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJECT_DIR)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(NAME): print_make $(OFILES)
	@ar rcs $(NAME) $(OFILES)
	@echo "The Object_Files have been made."
	@echo "The Library has been made."

clean: print_clean
	@rm -rf $(OBJECT_DIR)
	@echo "The Object_Files were removed successfully."

fclean: clean
	@rm -f $(NAME)
	@echo "The Library was removed successfully."

re: print_re fclean $(NAME)

print_make:
	@echo "\033[32m"
	@echo " ███╗   ███╗ █████╗ ██╗  ██╗███████╗"
	@echo " ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝"
	@echo " ██╔████╔██║███████║█████╔╝ █████╗  "
	@echo " ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝  "
	@echo " ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗"
	@echo " ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝"
	@echo "\033[0m"

print_clean:
	@echo "\033[33m"
	@echo "  ██████╗██╗     ███████╗ █████╗ ███╗   ██╗"
	@echo " ██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║"
	@echo " ██║     ██║     █████╗  ███████║██╔██╗ ██║"
	@echo " ██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║"
	@echo " ╚██████╗███████╗███████╗██║  ██║██║ ╚████║"
	@echo "  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝"
	@echo "\033[0m"

print_re:
	@echo "\033[31m"
	@echo "██████╗ ███████╗"
	@echo "██╔══██╗██╔════╝"
	@echo "██████╔╝█████╗  "
	@echo "██╔══██╗██╔══╝  "
	@echo "██║  ██║███████╗"
	@echo "╚═╝  ╚═╝╚══════╝"
	@echo "\033[0m"
	@echo "Rebuilding the Library."

.PHONY: all clean fclean re print_re

-include $(OFILES:.o=.d)
