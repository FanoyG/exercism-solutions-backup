#!/usr/bin/env bash

main() {
  # Function logic is directly inside the main function
  local number=$1
  local result=""

  # Check divisibility by 3, 5, and 7 and append corresponding sounds
  if (( number % 3 == 0 )); then
    result+="Pling"
  fi
  if (( number % 5 == 0 )); then
    result+="Plang"
  fi
  if (( number % 7 == 0 )); then
    result+="Plong"
  fi

  # If result is empty, return the number itself
  if [ -z "$result" ]; then
    echo "$number"
  else
    echo "$result"
  fi
}
main $@