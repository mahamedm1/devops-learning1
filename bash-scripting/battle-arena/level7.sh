#!/bin/bash
for file in *txt; do
echo "File name and size is:" $(stat -c "%s %n" $file)
done | sort -n $file

