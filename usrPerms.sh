#!/bin/sh

# Check if the user is root:
# if not, rerun the script through sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Take control of all the files for easier editing
chown -R $(whoami) ckan/
chown -R $(whoami) netkan/
