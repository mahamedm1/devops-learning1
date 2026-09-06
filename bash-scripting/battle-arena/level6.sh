#!/bin/bash
set -x

file_name=$1

if [[ $# -ne 0 && -f $file_name ]]; then
    echo "The number of lines in this file is:" $(wc -l < $file_name)
else
    echo "No file provided"
fi

