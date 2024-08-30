#!/bin/bash
for file in $(find . -type f ! -name "*.txt"); do
  mv "$file" "${file}.txt"
done