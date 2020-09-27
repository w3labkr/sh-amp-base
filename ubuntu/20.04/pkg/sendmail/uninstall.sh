#!/bin/bash
#
# Download and run the latest release version.
# https://github.com/w3labkr/sh-amp-init
#
# Usage
# git clone https://github.com/w3labkr/sh-amp-init.git
# cd sh-amp-init
# chmod +x ./install.sh
# ./install.sh

# Work even if somebody does "sh thisscript.sh".
set -e

# Print a welcome message.
echo
echo "Uninstallation begins."

# Stop the package.
systemctl stop sendmail

# Remove the package completely.
apt remove sendmail
apt purge sendmail
apt autoremove

# If the directory still exists, delete it.
if [ -d /etc/sendmail ]; then
  rm -rf /etc/sendmail
fi

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Removal is complete."