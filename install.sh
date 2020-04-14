#!/usr/bin/env bash

#
# This is written in bash for the sake of simplicity
#

echo "Starting script..."

if [[ "$#" != 0 ]] && [[ "$1" == "remove" ]]; then
	echo "Removing themes"
	rm -r "$HOME/.config/sublime-text-3/Packages/One-Dark-Package"
	rm -r "$HOME/.config/sublime-text-3/Packages/Eighties-Dark-Package"
	exit $? # Only the last one, this is very faulty

elif [[ "$#" != 0 ]]; then
	echo "This script only accepts the argument \"remove\", if you want to"
	echo "Install it, just run without any arguments"
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
echo "Thanks for using this very basic script :D"

set +e
