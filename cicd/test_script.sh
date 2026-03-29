#!/bin/bash
set -e

cd src && make clean && make && cd ..

test_case() {
    echo "Testing input: $1"
    if echo "$1" | ./src/matrix_task | grep -q "$2"; then
        echo "OK"
    else
        echo "FAILED: expected $2"
        exit 1
    fi
}

#аргумент 1 ввод, аргумент 2 что ищем в выводе
test_case "2 1 2 3 -1" "4"

test_case "2 2 2 3 4" "5"

test_case "1 -5" "-5"

test_case "abc 1 -5" "Error!" "Validation: letter instead of size"

test_case "101 1 10" "Error!" "Validation: size out of range"

echo "Done. All tests passed."
