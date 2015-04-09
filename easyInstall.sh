#!/usr/bin/env bash

# This script simplifies the installation of ckan on debian systems, like Ubuntu.
# Please note that it's still very experimental:
# it has been completely written by Ippo, who is not very much of a linux guy.
# Use at your own risk, and blame him for everything (m.ippolito@outlook.com)

# What does this script do?
# 1) adds the official mono-project repository (as the version in Ubuntu is too old for ckan)
# 2) updates the software list
# 3) installs mono-complete
# 4) downloads the .deb file from github
# 5) installs the package



# Check if the user is root:
# if not, rerun the script through sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Add the mono-project repository
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list
apt-get update

# Now install the latest version of mono-complete
apt-get install mono-complete

# Download the latest release of the ckan.deb package
curl -s -L https://github.com/KSP-CKAN/CKAN-deb/releases/latest | grep -E 'ckan.deb' | wget --base=http://github.com/ -i - -O ckan.deb

# Mark the package for installation
dpkg -i ckan.deb

# dpkg is a little weird sometimes: apt-get install -f cleans up after dpkg
apt-get install -f

# We made it!
exit 0
