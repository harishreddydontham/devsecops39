#!/bin/bash
word=$1
len=${#word}
str=''
for ((i = len; i >= 0; i--)); do
    str=${str}${word[@]:$i:1}
done
echo "The word is ${str}"

if [[ "${word}" = "${str}" ]]; then
    echo "the word is a palindrome"
else
    echo "its not a palindrome"
fi
