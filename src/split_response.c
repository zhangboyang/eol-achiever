#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "buffer.h"
#define BS 4096
int main(int argc, char *argv[])
{
    if (argc != 3) return 1;

    FILE *f;
    char *buf = NULL;
    const char *p = "\r\n\r\n";
    int cnt;
	
    load_buffer_until(p, &buf);
    
    f = fopen(argv[1], "wb");
    fwrite(buf, sizeof(char), strlen(buf), f);
    fwrite(p, sizeof(char), strlen(p), f);
    fclose(f);
    free(buf);
    
    f = fopen(argv[2], "wb");
    buf = (char *) malloc(BS);
    while (!feof(stdin)) {
        cnt = fread(buf, sizeof(char), BS, stdin);
        fwrite(buf, sizeof(char), cnt, f);
    }
    fclose(f);
    free(buf);

    return 0;
}
