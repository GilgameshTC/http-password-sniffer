#!/bin/bash
#============================================================
# A simple shell script to stop tshark and process pcap file
# Attempts to print out http-post password
# ----
# Note: Run this script with sudo privilege
#============================================================

FILE=./capture-output.pcapng
PCAP_FILE=packets.txt

# Stop tshark
pid=$(ps -e | pgrep tshark)
sudo kill -9 $pid

# Process pcap file created
tcpick -C -yU -r $FILE >> $PCAP_FILE
grep -F "usr" $PCAP_FILE

# Remove files created
rm $FILE
rm $PCAP_FILE

