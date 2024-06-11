#!/bin/bash

dut=./main

testid=0
unit_test() {
	((testid++))
	golden=$1
	inputs=$2
	output=$($dut $inputs)
	if [ "$output" != "$golden" ]; then
    		echo "Test case $testid failed: Expected $golden but got $output"
    		exit 1
	fi
    	echo "Test case $testid passed"
}

# Test case 1: Sum of numbers from 1 to 5
unit_test "15" "1 2 3 4 5"

# Test case 2: Sum of numbers from -3 to 3
unit_test "0" "-3 -2 -1 0 1 2 3"

# Test case 3: Sum of no numbers
unit_test "0" ""

