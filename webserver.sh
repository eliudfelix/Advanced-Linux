#!/bin/bash

# Open port 80 (HTTP)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Open port 8080 (HTTP alternative)
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

# Forward port 80 traffic to port 8080
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
