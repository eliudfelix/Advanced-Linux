#!/bin/bash

# Allow Incoming SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow outgoing SSH
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
