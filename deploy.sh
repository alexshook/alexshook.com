#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hyde-x # if using a theme, replace by `hugo -t <yourtheme>`

# Update public to latest version deployed
echo -e "\033[0;32mPulling latest version of site from GitHub...\033[0m"
git submodule update --remote public

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Back to master
git co master

# Come Back
cd ..
