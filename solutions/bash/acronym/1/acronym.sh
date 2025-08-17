#!/usr/bin/env bash

process_acro() {
    local str1="$1"
    local acr=''

    # Check if input is empty
    if [ -z "$str1" ]; then
        echo "No input string"
        return 1
    fi
    IFS=' -_*'
    # Loop through words in the string
    for word in $str1; do
        acr+="${word:0:1}"
    done

    # Convert to uppercase
    echo "${acr^^}"
}

# Pass arguments as a single string
process_acro "$*"
