#!/bin/bash

# Define the output file
output_file="/etc/custom-scripts/results/network_info.txt"

# Get IP Addresses
echo "IP Addresses:" | tee -a $output_file
ip -4 addr show | grep "inet " | awk '{print $2}' | tee -a $output_file
echo "" | tee -a $output_file

# Get DNS Servers
echo "DNS Servers:" |tee -a $output_file
grep "nameserver" /etc/resolv.conf | awk '{print $2}' | tee -a $output_file
echo "" | tee -a $output_file

# Get Open Ports
echo "Open Ports:" | tee -a $output_file
ss -tuln | grep "LISTEN" | tee -a $output_file
echo "" | tee -a $output_file

# Get Routing Table
echo "Routing Table:" | tee -a output_file
ip route show | tee -a output_file
echo "" | tee -a $output_file

# Get Network Interfaces
echo "Network Interfaces:" | tee -a $output_file
ip link show | tee -a $output_file
echo "" | tee -a $output_file

# Get Active Connections
echo "Active Connections:" | tee -a $output_file
ss -antup | tee -a $output_file
echo "" | tee -a $output_file

echo "Network information has been saved to $output_file"
