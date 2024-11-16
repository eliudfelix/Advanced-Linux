#!/bin/bash

# Deny Inooming SSH
iptables -A INPUT -p tcp --dport 22 -j DROP

# Deny outgoing SSH
iptables -A OUTPUT -p tcp --sport 22 -j DROP

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
