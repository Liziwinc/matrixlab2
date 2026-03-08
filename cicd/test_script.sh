#!/bin/bash
set -e

echo "Start test"
cd src && make clean && make

echo "2
1
2
3
-1" > input.txt

./matrix_task < input.txt > output.txt

if grep -q "4" output.txt && grep -q "\-1" output.txt; then
  echo "test PASSED: column sum correctly"
  exit 0
else
  echo "test FAILED: column sum not correctly"
  cat output.txt
  exit 1
fi