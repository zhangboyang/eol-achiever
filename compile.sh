#!/bin/sh
gcc -O2 -o src/buffer.o -c src/buffer.c
gcc -O2 -o parse_lesson_list src/buffer.o src/parse_lesson_list.c
gcc -O2 -o parse_file_list src/buffer.o src/parse_file_list.c
gcc -O2 -o parse_folder_list src/buffer.o src/parse_folder_list.c
gcc -O2 -o split_response src/buffer.o src/split_response.c
rm src/buffer.o

