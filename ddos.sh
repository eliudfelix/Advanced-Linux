#!/bin/bash

# Limit the # of connections from a single IP to 10 per minute
iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 10 -j REJECT --reject-with tcp-reset

# Drop packets from known malicious IPs
iptables -A INPUT -s 192.168.68.200 -j DROP

# Rate limiting: Allow a max of 25 new connections per minute from a single IP
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --update --seconds 60 --hitcount 25 -j DROP

# Save the rules
iptables-save > /home/efelix/iptables/rules.v4
