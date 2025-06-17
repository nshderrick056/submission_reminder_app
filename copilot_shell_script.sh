#!/bin/bash

# Asking the user for their folder name

read -p "Please insert in your student folder name: " dir_name

# Asking the user for the assignment name

read -p "Please insert in your assignment name: " assignment_name

# Replacing the ASSIGNMENT in config.env with the new assignment

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$dir_name/config/config.env"

echo "ASSIGNMENT updated to \"$assignment_name\" in $dir_name/config/config.env"

# Run the startup.sh script to reflect the changes
bash "$dir_name/startup.sh"
