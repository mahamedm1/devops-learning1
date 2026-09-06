#!/bin/bash
set -ex
# 1. Creates a directory named 'Battlefield'
# 2. Inside Battlefield, create files named knight.txt, sorcerer.txt, and rogue.txt.
# 3. Check if knight.txt exists; if it does, move it to a new directory called Archive.
# 4. List the contents of both Battlefield and Archive.

mkdir -p Battlefield
cd Battlefield
touch knight.txt sourcerer.txt rogue.txt
if [ -f knight.txt ]; then
    mkdir -p Archive/
    mv knight.txt Archive/
    echo "knight.txt has been moved to Archive."
else
    echo "knight.txt not found"
fi 

ls .. Archive

