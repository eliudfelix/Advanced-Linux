#!/bin/bash

# Block Telnet (port 23)
iptables -A INPUT -p tcp --dport 23 -j DROP

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
