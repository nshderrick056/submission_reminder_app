#!/bin/bash

# prompting the user for the user's name

read -p "Please insert your name: " name
sub_dir="submission_reminder_${name}"

# Time to create the sub-directories

mkdir -p $sub_dir/{app,modules,assests,config}

