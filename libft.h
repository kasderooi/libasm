/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libft.h                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: kas <kas@student.codam.nl>                   +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/02/09 10:20:19 by kas           #+#    #+#                 */
/*   Updated: 2021/10/29 14:38:27 by kde-rooi      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

# include <unistd.h>
# include <stdlib.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

extern int			ft_strlen(char *str);
extern char			*ft_strcpy(char *dst, const char *src);
extern char			*ft_strncpy(char *dst, const char *src, int len);
extern int			ft_strcmp(const char *s1, const char *s2);
extern ssize_t		ft_write(int fd, const void *buf, size_t nbyte);
extern ssize_t		ft_read(int fd, void *buf, size_t nbyte);
extern char			*ft_strdup(const char *s1);
extern char			*strchr(const char *s, int c);
extern int			ft_atoi_base(char *str, char *base);
extern void			ft_putchar(char c);
extern void			ft_putstr(char *str);
extern void			ft_putnbr(int nbr);
extern char			*ft_substr(char const *s, int start, size_t len);
extern int			ft_countwords(char *str, char c);
extern char			**ft_split(char const *s, char c);

#endif
