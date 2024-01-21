#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

# Find all folders to include
dirs=$(find . -maxdepth 1 -type d -not -name ".git" -not -name "." -not -name "setup.sh")

# Ask if each folder should be included
for dir in $dirs; do
  if ask "Include ${dir/'./'/''}?"; then
    # Get the files and folders we should link
    links=$(find $dir -maxdepth 2 -not -name ".config" -not -wholename $dir)
    for link in $links; do
      dest=${link/$dir/$HOME}
      # Check if the destination alredy exists
      if [ ! -e "$dest" ]; then 
        ln -nsv $(realpath $link) $dest
      else
        echo "Symbolic link not created: '$dest' already exists." 
        if ask "Remove [$dest]?"; then
          rm -rf $dest
          ln -nsv $(realpath $link) $dest
        fi 
      fi
    done
  fi
done
