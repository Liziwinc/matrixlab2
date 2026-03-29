#!/bin/bash
set -e

cd src && make clean && make && cd ..

test_case() {
    echo "Testing input: $1"
    if echo "$1" |  timeout 2s ./src/matrix_task | grep -q -e "$2"; then
        echo "OK"
    else
        echo "FAILED or TIMEOUT: expected $2"
        exit 1
    fi
}

#аргумент 1 ввод, аргумент 2 что ищем в выводе
test_case "2 1 2 3 -1" "4"

test_case "2 2 2 3 4" "5"

test_case "1 -5" "-5"

test_case "$(printf "abc\n1\n-5")" "Error!"

test_case "$(printf "101\n1\n10")" "Error!"

echo "Done. All tests passed."
