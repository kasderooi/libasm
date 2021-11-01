NAME	=	libasm.a
SRCS	=	ft_putchar.s ft_putstr.s ft_putnbr.s \
			ft_strlen.s ft_strcpy.s ft_strcmp.s \
			ft_write.s ft_read.s ft_strdup.s \
			ft_atoi_base.s ft_strchr.s ft_substr.s \
			ft_strncpy.s ft_countwords.s ft_split.s
OBJS	=	ft_putchar.o ft_putstr.o ft_putnbr.o \
			ft_strlen.o ft_strcpy.o ft_strcmp.o \
			ft_write.o ft_read.o ft_strdup.o \
			ft_atoi_base.o ft_strchr.o ft_substr.o \
			ft_strncpy.o ft_countwords.o ft_split.o
OUTPUT	=	libasm.out

all:		$(NAME)
$(NAME):	$(OBJS)
			ar -rcs $(NAME) $(OBJS)

%.o: 		%.s
			nasm -f macho64 -o $@ $<

compile:	$(NAME)
			gcc main.c $(NAME) -o $(OUTPUT)

run:		compile
			./$(OUTPUT)

clean:
			rm $(OBJS)

fclean:		clean
			rm $(NAME) $(OUTPUT)

re:			fclean all

.PHONY:		all %.o compile run clean fclean re
