#include <stdio.h>
#include <stdlib.h>
#include "buffer.h"
int main(void)
{
    char *a, *b, *c, *p;
    int id1, id2;
    a = b = c = NULL;
    load_buffer_until("lid=", NULL);
    load_buffer_until(">", &a);
    sscanf(a, "%d", &id2);
    while (load_buffer_until("download.jsp?fileid=", NULL) == 0) {
        load_buffer_until("&resid=", &a);
        load_buffer_until("\">", &b);
        load_buffer_until("</a>", &c);
        sscanf(b, "%d", &id1);
        for (p = c; *p != '\0'; p++)
            if (*p == '\n') {
                *p = '\0';
                break;
            }
        printf("%s %d %d %s\n", a, id1, id2, c);
    }
    free(a); free(b); free(c);
    return 0;
}
