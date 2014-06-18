#include <stdlib.h>
#include <stdio.h>
#include "buffer.h"
int main(void)
{
    char *a, *b, *c, *d;
    a = b = c = d = NULL;
    while (load_buffer_until("stu_left_course_menu.jsp?lid=", NULL) == 0) {
        load_buffer_until("&colum", &a);
        load_buffer_until("')\" >", NULL);
        load_buffer_until("</a>", &b);
        load_buffer_until("<td>", NULL);
        load_buffer_until("</td>", &c);
        load_buffer_until("<td>", NULL);
        load_buffer_until("</td>", &d);
        printf("%s %s-%s-%s\n", a, c, b, d);
    }
    free(a); free(b); free(c); free(d);
    return 0;
}

