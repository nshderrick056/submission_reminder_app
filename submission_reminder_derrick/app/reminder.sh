
#!/bin/bash

# Getting the current directory

dir="$(cd "$(dirname "$0")/.." && pwd)"

# Source environment variables and helper functions
source "$dir/config/config.env"
source "$dir/modules/functions.sh"

# Path to the submissions file
submissions_file="$dir/assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

