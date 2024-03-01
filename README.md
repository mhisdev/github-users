# WSL2 GitHub User Manager

Manage GitHub user configurations in WSL2 environment by setting global username and email from a predefined list of users.

## Setup Instructions

1. **Define User List:**
   - Create a `user_list.txt` file containing a list of GitHub user details in the format: `username|email@example.com`. 
   - Ensure there's an empty line at the end of the file.

2. **Set Execute Permission:**
   - Make the `manage.sh` file executable by running the following command:
     ```
     chmod +x github-users/manage.sh
     ```

3. **Run the Script:**
   - Execute the script `github-users/manage.sh`.
   - Follow the prompts to select the desired user details.

## Troubleshooting

- If you encounter permission errors while running the script, ensure that you have the necessary permissions to execute it. Use `chmod` to set the correct permissions if needed.
- If the script fails to read the `user_list.txt` file, verify that the file exists and is properly formatted.
- For any other issues, refer to the documentation or open an issue on the GitHub repository for assistance.

## License

This project is licensed under the [MIT License](LICENSE).



