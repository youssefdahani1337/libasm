#include <stdio.h>
#include <errno.h>
#include <string.h>
#include "libasm.h"


int main(void)
{
    const char *msg = "hello from ft_write\n";

    // success case
    ssize_t ret = ft_write(1, msg, strlen(msg));
    printf("ft_write returned: %zd\n", ret);

    ssize_t length =  ft_strlen(msg);

   printf("the len : %zd\n", length); 
    // error case: fd -1 is always invalid
    errno = 0;
    ret = ft_write(-1, msg, strlen(msg));
    printf("ft_write returned: %zd, errno = %d (%s)\n",
           ret, errno, strerror(errno));

    return 0;
}

