#!/usr/bin/env bash

#
# This is written in bash for the sake of simplicity
#

echo "Starting script..."

if [[ "$#" != 0 ]]; then
	echo "This script takes no arguments"
	exit 1
elif [[ ! -d "$HOME/.config/sublime-text-3" ]]; then
	echo "Sublime configuration folder not found at $HOME/.config/sublime-text-3"
	exit 1
elif [[ ! -d "$HOME/.config/sublime-text-3/Packages" ]]; then
	echo "Could not found Packages folder at $HOME/.config/sublime-text-3/Packages"
	exit 1
fi 

set -e

function safe-cd()
{
	cd "$1" || exit 1
}

themes_dir=$(pwd)

safe-cd "$HOME/.config/sublime-text-3/Packages"

mkdir 'One-Dark-Package'
cp "${themes_dir}/One Dark.tmTheme" 'One-Dark-Package'

mkdir 'Eighties-Dark-Package'
cp "${themes_dir}/Eighties Dark.tmTheme" 'Eighties-Dark-Package'

echo "Fine, no errors, check if your themes are now available inside of sublime."

set +e
