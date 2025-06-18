# Submission Reminder App

The **Submission Reminder App** is a Bash-based utility designed to help track and notify students about pending assignment submissions. This tool is especially useful in educational environments or learning programs where multiple students are expected to submit assignments within a given deadline.

## Project Description

This project automatically creates a personalized working environment with all necessary files and scripts to check student submissions, manage assignments, and issue reminders. It allows users to:
- Set up an environment for tracking submissions
- Load configuration values such as assignment name and deadline
- Check which students have not submitted a specific assignment
- Easily update the assignment being tracked

## Scripts and Their Purpose

### `create_environment.sh`
This script:
- Prompts the user for their name
- Creates a folder named `submission_reminder_<your_name>` containing subdirectories:
  - `app/`: Main application logic
  - `modules/`: Helper functions
  - `assets/`: Student submission records
  - `config/`: Environment variables
- Initializes key files such as:
  - `reminder.sh`: Reads config and runs the reminder check
  - `functions.sh`: Defines the `check_submissions` function
  - `submissions.txt`: Sample student submission data
  - `config.env`: Stores assignment name and deadline
  - `startup.sh`: Launches the app by invoking the main script

### `startup.sh`
This script runs the core reminder app by executing `reminder.sh` located inside the `app/` directory.

### `reminder.sh`
- Loads configuration values like assignment name and remaining days
- Uses helper functions to read and process submission records
- Displays students who have not submitted the given assignment

### `functions.sh`
Defines a function called `check_submissions` that:
- Reads a `.csv`-like text file (`submissions.txt`)
- Checks each record to see if a student has not submitted the current assignment
- Displays a reminder message for each student who hasn't submitted

### `copilot_shell_script.sh`
Allows the user to:
- Enter the name of their folder
- Change the assignment being tracked
- Automatically update the `config.env` file and rerun the app

## Project Structure

submission_reminder_<your_name>/
├── app/
│ └── reminder.sh
│
├── modules/
│ └── functions.sh
│
├── assets/
│ └── submissions.txt
│
├── config/
│ └── config.env
│
└── startup.sh
