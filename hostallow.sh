#!/bin/bash

# Allow traffic from a specific IP Address
iptables -A INPUT -s 192.168.68.100 -j ACCEPT

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
