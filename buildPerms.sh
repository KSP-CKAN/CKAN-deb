#!/bin/sh

# Check if the user is root:
# if not, rerun the script through sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# To build the package correctlu,
# everything must belong to root
chown -R root:root ckan/
chown -R root:root netkan/

# All the folders must have permission 755...
find ckan/ -type d -exec chmod 755 {} \;
find netkan/ -type d -exec chmod 755 {} \;

# ... all the files must have permission 644...
find ckan/ -type f -exec chmod 644 {} \;
find netkan/ -type f -exec chmod 644 {} \;

# ... except the executables
chmod -R +x ckan/usr/bin/ckan/
chmod -R +x netkan/usr/bin/ckan/
