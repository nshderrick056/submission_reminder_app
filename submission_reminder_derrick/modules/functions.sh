
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=
    echo "Checking submissions in "

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=
        assignment=sdl
        status=not submitted

        # Check if assignment matches and status is 'not submitted'
        if [[ "sdl" == "" && "not submitted" == "not submitted" ]]; then
            echo "Reminder:  has not submitted the  assignment!"
        fi
    done < <(tail -n +2 "") # Skip the header
}

