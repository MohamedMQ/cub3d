# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmaqbour <mmaqbour@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/29 21:01:57 by drtaili           #+#    #+#              #
#    Updated: 2023/09/11 10:21:38 by mmaqbour         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS_LIST = draw.c draw_1.c main.c utils.c init.c \
		dda.c move_shape.c check_map.c check_map_1.c free_all.c \
		pars_map.c pars_map_1.c parsing.c pars_textures1.c \
		pars_textures1_1.c pars_textures2.c

B_SRCS_LIST = draw.c draw_1.c main.c utils.c init.c \
		dda.c move_shape.c check_map.c check_map_1.c free_all.c \
		pars_map.c pars_map_1.c parsing.c pars_textures1.c \
		pars_textures1_1.c pars_textures2.c minimap.c minimap_1.c

SRCDIR = ./mandatory/
B_SRCDIR = ./bonus/
SRCS = $(addprefix $(SRCDIR), $(SRCS_LIST))
B_SRCS = $(addprefix $(B_SRCDIR), $(B_SRCS_LIST))

OBJDIR = ./mandatory/objs/
B_OBJDIR = ./bonus/b_objs/
OBJS = $(addprefix $(OBJDIR), $(SRCS_LIST:.c=.o))
B_OBJS = $(addprefix $(B_OBJDIR), $(B_SRCS_LIST:.c=.o))

NAME = cube3d
B_NAME = cube3d_bonus

HEADER = mandatory/cube3d.h
B_HEADER = bonus/cube3d.h

CC = cc
RM = rm -rf
LIBFT = libft/libft.a
FLAGS = -Wall -Wextra -Werror
FLAGS_mlx = -lm -lmlx -framework OpenGL -framework AppKit

all: $(NAME)

$(NAME) : $(LIBFT) $(OBJDIR) $(OBJS)
	$(CC) $(FLAGS) $(LIBFT) $(FLAGS_mlx) $(OBJS) -o $(NAME)

$(LIBFT) :
	@make -C libft

$(OBJDIR)%.o : $(SRCDIR)%.c $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@

$(OBJDIR):
	@mkdir $@

bonus: $(B_NAME)

$(B_NAME): $(LIBFT) $(B_OBJDIR) $(B_OBJS)
	$(CC) $(FLAGS) $(LIBFT) $(FLAGS_mlx) $(B_OBJS) -o $(B_NAME)

$(B_OBJDIR)%.o : $(B_SRCDIR)%.c $(B_HEADER)
	$(CC) $(FLAGS) -c $< -o $@

$(B_OBJDIR):
	@mkdir $@

clean:
	@make clean -C libft
	$(RM) $(OBJDIR)
	$(RM) $(B_OBJDIR)

fclean: clean
	@make fclean -C libft
	$(RM) $(NAME)
	$(RM) $(B_NAME)

re: fclean $(NAME)

.PHONY = all bonus clean fclean re
