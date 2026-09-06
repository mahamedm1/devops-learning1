#!/bin/bash

set -x

file_name=$1

if [[ $# -eq 0 ]]; then
  echo "No file provided"
  exit 1
fi

if [[ ! -f $file_name ]]; then
  echo "File not found"
  exit 1
fi

line_count=$(wc -l < $file_name)
