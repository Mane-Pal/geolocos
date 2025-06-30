#!/bin/bash
# Configure user identification for git

set -e

yay -S --noconfirm --needed gum

echo -e "\nEnter identification for git and autocomplete..."
export USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"