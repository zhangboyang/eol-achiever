#include <stdio.h>
#include <stdlib.h>
#include "buffer.h"

int main(void)
{
    int d;
    char *a, *b, *c, *p;
    a = b = c = NULL;
    while (load_buffer_until("./styles/default/image/folder.gif", NULL) == 0) {
        load_buffer_until("folderid=", NULL);
        load_buffer_until("&lid=", &a);
        load_buffer_until("\"", &b);
        load_buffer_until("\">", NULL);
        load_buffer_until("</a>", &c);
        sscanf(b, "%d", &d);
        for (p = c; *p != '\0'; p++)
            if (*p == '\n') {
                *p = '\0';
                break;
            }
        printf("%s %d %s\n", a, d, c);
    }
    free(a); free(b); free(c);
    return 0;
}
