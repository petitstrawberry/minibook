#!/bin/bash

# Change to the directory of the script
cd "$(dirname "$0")"

# Check if $DESTDIR is set
if [ -z "$DESTDIR" ]; then
    echo "Please set DESTDIR"
    exit
fi

# Copy the trackpadd.service file to $DESTDIR
echo "Copying trackpadd.service to $DESTDIR"
install  -Dm644 ./trackpadd.service $DESTDIR/trackpadd.service
