#!/bin/bash

# Fix Git configuration for GitHub Codespaces
# This script resolves the "403 | Author is invalid" error

echo "Fixing Git configuration..."

# Set your GitHub username
git config --global user.name "GuestFreak-eng"

# Set your GitHub email (using GitHub's no-reply email)
# Replace with your verified GitHub email if you have one
git config --global user.email "244913075+GuestFreak-eng@users.noreply.github.com"

# Disable GPG commit signing which is causing the error
git config --global commit.gpgsign false

# Disable GPG tag signing
git config --global tag.gpgsign false

# Show current configuration
echo "\nCurrent Git configuration:"
git config --global --get user.name
git config --global --get user.email
git config --global --get commit.gpgsign

echo "\n✅ Git configuration has been fixed!"
echo "You should now be able to commit without errors."
