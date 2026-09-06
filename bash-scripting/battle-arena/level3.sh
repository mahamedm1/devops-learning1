#!/bin/bash

file_name=$1
if [ -f file_name ]; then
    echo "Hero found!"
else
    echo "Hero missing"
fi
