#!/bin/bash
# will need to use grep
# in all files ending in .log so *.log
word=$1

if [ $# -eq 0 ]; then 
    echo "no phrase entered" 
    exit 1 
fi


grep -l "$word" *.log 
