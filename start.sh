#!/usr/bin/env bash

# Usage example: sh start.sh -user_dir "name of user dir"
while [ $# -gt 0 ]; do
  case "$1" in
    -a|-user_dir|--user_dir)
      user_dir="$2"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
  shift
done

# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add to PATH
PATH=$PATH:/opt/homebrew/bin
echo export PATH=$PATH:/opt/homebrew/bin >> ~/.zshrc
# Test with 'brew doctor'
brew doctor

# 2. Create 'Projects' folder
mkdir -p /Users/${user_dir}/Projects

# 3. Install Git
brew install git

# 4. Setup SSH key for GH
mkdir -p /Users/${user_dir}/.ssh
cd /Users/${user_dir}/.ssh
ssh-keygen -t rsa -b 2048
# Copy with: 'cat id_rsa.pub | pbcopy'

# Type yes when first cloning a repository, so that GH can be added to the known SSH hosts:
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

# Set the same e-mail address that your GH account is associated with:
# git config --global user.email test@abcd.com
