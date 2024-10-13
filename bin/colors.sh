#!/bin/bash

for i in {0..255} ; do
    printf "\x1b[38;5;%smcolour%s\n" "${i}" "${i}"
done

for i in {0..16}; do
  echo -ne "\033[48;5;$(( 16 + i*4))m \033[0m"
done

echo -ne "\033[0m \n"

for i in {0..99}; do
  r=$((i * 255 / 99))
  g=0
  b=$((255 - i * 255 / 99))
  printf "\033[48;2;${r};${g};${b}m \033[0m"
done

echo -ne "\033[0m \n"

for i in {0..99}; do
  r=$((i * 128 / 99 + 127))
  g=$((i * 255 / 99))
  b=$((255 - i * 255 / 99))
  printf "\033[48;2;${r};${g};${b}m \033[0m"
done
