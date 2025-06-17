
#!/bin/bash

echo "Running the submission reminder app___"

path="$(cd "$(dirname "$0")" && pwd)"

bash "$path/app/reminder.sh"

