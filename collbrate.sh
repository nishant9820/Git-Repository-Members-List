#!/bin/bash


###############################
#Author: Nishant
#Date: 11/10/2024
#
#Version: v1
#
#This script will report all the pull request for github repository
##############################


# Define the output file
OUTPUT_FILE="pullRequest"

#Github Config
GITHUB_TOKEN=$Token
OWNER=$1
REPONAME=$2


#Creating a helper function
helper(){
 expected_no_args=2
 if [ $# -ne $expected_no_args ]; then
  echo "Please execute the script with required cmd args"
  exit 1
 fi
}


# Check if the token is set
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GitHub token is not set."
  exit 1
fi

# Call the helper function to check for the right number of arguments
helper "$@"

#Finding all the pull request and export them to output file
echo "Fetching all members from the repository $OWNER/$REPONAME..."
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/$OWNER/$REPONAME/collaborators" | jq '.[].login' > "$OUTPUT_FILE" 

echo "members are :"
cat "$OUTPUT_FILE"
