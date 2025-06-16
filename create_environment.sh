#!/bin/bash

# prompting the user for the user's name

read -p "Please insert your name: " name
sub_dir="submission_reminder_${name}"

# Time to create the sub-directories

mkdir -p $sub_dir/{app,modules,assests,config}

# creating the config.env

cat << EOF > $sub_dir/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOF

# creating the reminder.sh

cat << EOF > $sub_dir/app/reminder.sh

#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF

