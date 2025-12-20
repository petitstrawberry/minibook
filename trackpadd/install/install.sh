#!/bin/bash
# Install script for trackpadd as a systemd service

# Check if the script is run as root
# If not, exit with error

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Change to the directory of the script
cd "$(dirname "$0")"

# Execute the install-executable.sh script
chmod +x ./install-executable.sh
DESTDIR="/usr/bin" ./install-executable.sh
# Execute the install-service.sh script
chmod +x ./install-service.sh
DESTDIR="/etc/systemd/system" ./install-service.sh

# Reload systemd
echo "Reloading systemd"
systemctl daemon-reload

# Start the trackpadd service
# Enable the trackpadd service to start on boot

echo "Starting trackpadd service"
systemctl enable trackpadd
systemctl start trackpadd

echo "trackpadd installed successfully"

