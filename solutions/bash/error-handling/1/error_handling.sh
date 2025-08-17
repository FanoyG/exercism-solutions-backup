#!/usr/bin/env bash

# Main function to handle the logic
main() {
  # Check the number of arguments passed to the program
  if [ $# -eq 0 ]; then
    # No arguments passed
    echo "Usage: error_handling.sh <person>"
    exit 1
  elif [ $# -gt 1 ]; then
    # More than one argument passed
    echo "Usage: error_handling.sh <person>"
    exit 1
  else
    # Exactly one argument passed
    if [ -z "$1" ]; then
      # If the argument is an empty string
      echo "Hello, "
    else
      # Greet the person
      echo "Hello, $1"
    fi
  fi
}

# Call the main function with all of the positional arguments
main "$@"
