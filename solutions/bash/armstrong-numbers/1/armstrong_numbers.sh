#!/usr/bin/env bash

arms_num() {
    local num=$1
    local sum=0

    if [ -z "$num" ]; then
        echo "No number provided"
        return 1
    fi

    # Extract each digit and compute sum
    for (( i=0; i<${#num}; i++ )); do
        digit=${num:i:1}  # Extract each digit
        sum=$(( sum + digit ** ${#num} ))
    done

    # Check if the sum matches the original number
    if [ "$sum" -eq "$num" ]; then
        echo "true"
    else
        echo "false"
    fi
}

arms_num "$1"
