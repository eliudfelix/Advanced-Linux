#!/bin/bash

# Block Ping
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
