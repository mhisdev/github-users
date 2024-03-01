#!/bin/bash

# Define the path to your text file
file="./user_list.txt"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file not found."
    exit 1
fi

# Ouput GitHub global users
display_global_user() {
    echo "*** GitHub global user ***"
    user_details=$(git config --global --list)

    # Check if user_details is empty
    if [ -z "$user_details" ]; then
        echo "Not set"
    else
        echo "$user_details"
    fi

    echo
}

display_global_user

# Read the file line by line and store usernames and emails in arrays
usernames=()
emails=()
while IFS='|' read -r username email; do
    usernames+=("$username")
    emails+=("$email")
done <"$file"

# Display the list of users
echo "*** List of users ***"
for ((i = 0; i < ${#usernames[@]}; i++)); do
    echo "$((i + 1)): ${usernames[$i]} (${emails[$i]})"
done

# Prompt the user to choose a user
read -p "Enter the number of the user you want to select or 'quit' to cancel: " choice

# Check if the user wants to quit
if [[ "$choice" == "quit" ]]; then
    echo "Operation canceled."
    exit 0
fi

# Validate user input
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Check if the choice is within the range
if ((choice < 1 || choice > ${#usernames[@]})); then
    echo "Error: Invalid choice."
    exit 1
fi

# Subtract 1 from the choice to match array indexing
selected_index=$((choice - 1))

# Output the selected username and email
echo
echo "Selected User: ${usernames[$selected_index]} (${emails[$selected_index]})"

# Set Global GitHub username email
git config --global user.name "${usernames[$selected_index]}"
git config --global user.email "${emails[$selected_index]}"
display_global_user
