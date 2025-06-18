#!/bin/bash

# prompting the user for the user's name

read -p "Please insert your name: " name

# making sure the input is valid

if [[ -z "$name" ]]; then
	echo "Error: The name can not be empty. "
	exit 1
fi

sub_dir="submission_reminder_${name}"

# Time to create the sub-directories

mkdir -p "$sub_dir"/{app,modules,assets,config} || {
       echo "failure to create the directories."
       exit 1
}

# creating the config.env

cat << 'EOF' > $sub_dir/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOF

# creating the reminder.sh

cat << 'EOF' > $sub_dir/app/reminder.sh

#!/bin/bash

# Getting the current directory

dir="$(cd "$(dirname "$0")/.." && pwd)"

# Source environment variables and helper functions

# load configuration for the config.env

source "$dir/config/config.env"
source "$dir/modules/functions.sh"

# Path to the submissions file
submissions_file="$dir/assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF

# creating the function.sh

cat << 'EOF' > $sub_dir/modules/functions.sh

#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF

# creating the submissions.txt with atleast 5 entries

cat << 'EOF' > $sub_dir/assets/submissions.txt

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Derrick, Linux, not submitted
Nshuti, Programming, not submitted
Godlove, Sdl, submitted

EOF


# creating the startup.sh

cat << EOF > $sub_dir/startup.sh

#!/bin/bash

echo "Running the submission reminder app___"

path="\$(cd "\$(dirname "\$0")" && pwd)"

bash "\$path/app/reminder.sh"

EOF

# turning all the .sh files executable

# Make all .sh files executable
find $sub_dir -name "*.sh" -exec chmod 777 {} \;

echo "The setup has been fully completed and can be found in your personal: $sub_dir folder."
