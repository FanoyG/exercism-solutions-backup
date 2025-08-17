#!/usr/bin/env bash

main() {
  # Check if a name is provided (argument passed)
  if [ -z "$1" ]; then
    # If no argument is passed, print "One for you, one for me."
    echo "One for you, one for me."
  else
    # If a name is passed, print "One for <name>, one for me."
    echo "One for $1, one for me."
  fi
}

# Call the main function with all of the positional arguments
main "$@"
