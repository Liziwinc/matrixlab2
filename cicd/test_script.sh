#!/bin/bash
set -e

echo "Start test"
cd src && make clean && make

echo "2 1 2 3 -1" > input.txt

./matrix_task < input.txt > output.txt

if grep -q "4" output.txt && grep -q "\-1" output.txt; then
  echo "test1 PASSED: column sum correctly"
else
  echo "test1 FAILED: column sum not correctly"
  cat output.txt
  exit 1
fi

echo "2 2 2 3 -1" > input.txt

./matrix_task < input.txt > output.txt

if grep -q "5" output.txt; then
  echo "test2 PASSED: sum correctly"
else
  echo "test2 FAILED: expected 5"
  cat output.txt
  exit 1
fi

echo "All tests passed"
exit 0
