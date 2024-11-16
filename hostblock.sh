#!/bin/bash

# Block traffic from a specific IP address
iptables -A INPUT -s 192.168.68.100 -j DROP

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
