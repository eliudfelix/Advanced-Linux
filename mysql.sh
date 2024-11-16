#!/bin/bash

# Open port 3306 (MYSQL)
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
