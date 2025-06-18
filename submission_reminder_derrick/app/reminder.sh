
#!/bin/bash

# Getting the current directory

dir="$(cd "$(dirname "$0")/.." && pwd)"

# Source environment variables and helper functions

# the config.env load configuration

if ! source "$dir/config/config.env"; then
    echo "failing to load the config.env"
    exit 1
fi

# the function.sh load configuration

if ! source "$dir/modules/functions.sh"; then
    echo "Failing to load the functions.sh"
    exit 1
fi

# Path to the submissions file
submissions_file="$dir/assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

