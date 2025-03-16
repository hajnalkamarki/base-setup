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

###### Basics ######
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add to PATH
PATH=$PATH:/opt/homebrew/bin
echo export PATH=$PATH:/opt/homebrew/bin >> ~/.zshrc
# Test with 'brew doctor'
brew doctor

# Create 'Projects' folder
mkdir -p /Users/${user_dir}/Projects

###### Version Control ######
# Install Git
brew install git

# Setup SSH key for GH
mkdir -p /Users/${user_dir}/.ssh
cd /Users/${user_dir}/.ssh
ssh-keygen -t rsa -b 2048
# Copy with: 'cat id_rsa.pub | pbcopy'

# Type yes when first cloning a repository, so that GH can be added to the known SSH hosts:
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

# Set the same e-mail address that your GH account is associated with:
# git config --global user.email test@abcd.com

###### Install OhMyZsh ######
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10K theme for OhMyZsh
cd /Users/${user_dir}/.oh-my-zsh/custom/themes/
git clone https://github.com/romkatv/powerlevel10k.git

# In the .zshrc file set ZSH_THEME="powerlevel10kp/powerlevel10k"
# Setup based on https://www.youtube.com/watch?v=CF1tMjvHDRA

# Setup zsh-autosuggestions plugin
cd /Users/${user_dir}/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions
# Add plugin cfg into the .zshrc file

# Setup zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting
# Add plugin cfg into the .zshrc file

# Setup zsh-history-search
git clone https://github.com/zsh-users/zsh-history-substring-search
# Add plugin cfg into the .zshrc file

# Add 'web-search' to zshrc plugins

# To apply changes type 'source ~/.zshrc'
