#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define MAX_BUFFER_SIZE 32 * 1024 * 1024

typedef char buf_t[MAX_BUFFER_SIZE];
static buf_t buf;
static int buf_ptr;
static int full;

static void reset_buffer()
{
    buf_ptr = 0, full = 0;
}
static void put_to_buffer(int c)
{
    buf[buf_ptr] = c;
    if (buf_ptr + 1 == MAX_BUFFER_SIZE)
        buf_ptr = 0, full = 1;
    else
        buf_ptr++;
}
static int get_buffer_size()
{
    return full ? MAX_BUFFER_SIZE : buf_ptr;
}
static void get_buffer(char *a, int size)
{
    int ptr = full ? buf_ptr : 0;
    int aptr = 0;
    do {
        a[aptr++] = buf[ptr];
        if (aptr >= size) break;
        if (ptr + 1 == MAX_BUFFER_SIZE)
            ptr = 0;
        else
            ptr++;
    }
    while (ptr != buf_ptr);
}
void get_next(int *next, const char *p, int len)
{
    int i = 0, j = -1;
    next[0] = -1;
    while (i < len - 1)
        if (j == -1 || p[i] == p[j]) {
            i++, j++;
            next[i] = p[i] != p[j] ? j : next[j];
        }
        else
            j = next[j];
}
int load_buffer_until(const char *p, char **dest)
{
    reset_buffer();
    int len = strlen(p);
    int ptr = 0;
    int c;
    int *next = (int *) malloc(len * sizeof(int));
    get_next(next, p, len);
    while ((c = getchar()) != EOF) {
        if (dest) put_to_buffer(c);
        while (ptr != -1 && c != p[ptr]) ptr = next[ptr];
        if (ptr == -1 || c == p[ptr]) ptr++;
        if (ptr == len) break;
    }
    free(next);
    if (c == EOF) return -1;
    if (dest) {
        if (*dest) free(*dest);
        int size = get_buffer_size() - len + 1;
        *dest = (char *) malloc(size);
        get_buffer(*dest, size);
        (*dest)[size - 1] = '\0';
    }
    return 0;
}


