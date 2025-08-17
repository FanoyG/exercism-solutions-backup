#!/usr/bin/env bash

hamming_distance() {
    local str1=$1
    local str2=$2
    local distance=0

    # Ensure both strings are of the same length
    if [ ${#str1} -ne ${#str2} ]; then
        echo "strands must be of equal length" >&2
        return 1
    fi

    for (( i=0; i<${#str1}; i++ )); do
        if [ ${str1:$i:1} != ${str2:$i:1} ]; then
            ((distance++))
        fi
    done

    echo $distance
}

main() {
    # Ensure exactly two arguments are provided
    if [[ $# -ne 2 ]]; then
        echo "Usage: hamming.sh <string1> <string2>" >&2
        exit 1
    fi

    hamming_distance "$1" "$2"
}

# Call the main function
main "$@"
