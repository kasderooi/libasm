/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: kas <kas@student.codam.nl>                   +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/02/09 10:21:29 by kas           #+#    #+#                 */
/*   Updated: 2021/10/29 14:40:01 by kde-rooi      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>

void	print_ret(char *test, char *str1, char *str2, int ret)
{
	ft_putchar('\n');
	ft_putstr("---");
	ft_putstr(test);
	ft_putstr("---");
	ft_putchar('\n');
	if (str2)
	{
		ft_putstr("str1:\t");
		ft_putstr(str1);
		ft_putchar('\n');
		ft_putstr("str2:\t");
		ft_putstr(str2);
	}
	else
		ft_putstr(str1);
	ft_putchar('\n');
	ft_putstr("ret:\t");
	ft_putnbr(ret);
	ft_putchar('\n');
	ft_putchar('\n');
}

int		main(void)
{
	char	*str1;
	char	*str2;
	char	str3[1024];
	char	**str;
	int		ret;
	int		fd;

	str1 = ft_strdup("string1");
	str2 = ft_strdup("string2");
	ret = ft_strcmp(str1, str2);
	print_ret("strcmp", str1, str2, ret);
	ft_strcpy(str1, "nieuw!!");
	ft_strcpy(str2, "nieuw!!");
	ret = ft_strcmp(str1, str2);
	print_ret("strcpy", str1, str2, ret);
	fd = open("main.c", O_RDONLY);
	ret = ft_read(fd, str3, 1023);
	print_ret("read", str3, NULL, ret);
	close(fd);
	ft_strcpy(str3, "");
	ret = ft_read(fd, str3, 1023);
	print_ret("read", str3, NULL, ret);
	free(str1);
	free(str2);
	str1 = ft_strdup("C8");
	str2 = ft_strdup("0123456789ABCDEF");
	ret = ft_atoi_base(str1, str2);
	print_ret("atoi_base", str1, str2, ret);
	str = ft_split("dit is een string", ' ');
	ret = 0;
	while (str[ret])
	{
		ft_putstr(str[ret]);
		ft_putchar('\n');
		ret++;
	}
	return (0);
}
