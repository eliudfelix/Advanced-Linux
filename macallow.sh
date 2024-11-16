#!/bin/bash

# Allow traffic from a specific MAC address
iptables -A INPUT -m mac --mac-source 00:11:22:33:44:55 -j ACCEPT

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
