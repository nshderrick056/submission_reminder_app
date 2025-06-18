#!/bin/bash

# Asking the user for their folder name

read -p "Please insert in your student folder name: " dir_name

if [[ ! -d "$dir_name" ]]; then
	echo "Error: Folder '$dir_name' does not exist."
	exit 1
fi

# Asking the user for the assignment name

read -p "Please insert in your assignment name: " assignment_name

# Trim whitespace from input
assignment_name=$(echo "$assignment_name" | xargs)

#validate assignment name

if [[ -z "$assignment_name" ]]; then
        echo "Error: Assignment can not be empty."
        exit 1
fi

# Define path to config file
config_file="$dir_name/config/config.env"

# we check if the config file exists

if [[ ! -f "$config_file" ]]; then
       	echo "Error: config.env not found in $dir_name/config"
	exit 1
fi

# Replacing the ASSIGNMENT in config.env with the new assignment

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

echo "ASSIGNMENT updated to \"$assignment_name\" in $config_file"

# Run the startup.sh script to reflect the changes

bash "$dir_name/startup.sh" || {
	
	echo "Error: Failed to run $dir_name/startup.sh"
        exit 1

}
