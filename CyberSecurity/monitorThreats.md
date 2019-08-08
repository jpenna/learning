# Network Monitoring for Threats

## Syslog
Log to a server (syslog server or syslog viewer).

### rsyslog
Application for syslogging
- https://www.marcus-povey.co.uk/2013/05/15/using-a-central-log-server-to-monitor-your-devices/
- http://www.aboutdebian.com/syslog.htm
- http://loganalyzer.adiscon.com/
- https://www.howtoforge.com/centralized-rsyslog-server-monitoring

### Network Monitoring
Dig into the traffic and see what is happening, use protocol analyzer.

#### Wireshark
Free, GUI

#### tshark
CLI of Wireshark.  
Has more options than `tcpdump`.  
Usually only available if `Wireshark` is installed.

#### tcpdump
CLI, usually included on routers and other devices

Try SSH on router and running it from there.

Cheat sheet  
http://packetlife.net/media/library/12/tcpdump.pdf

`tcpdump -D` : List interfaces  
`tcpdump -i <interface>` : Capture the traffic
`tcpdump -i any` : monitor all traffic  
`tcpdump -n -i <interface>` : don't convert addresses to names  
`tcpdump -n -i <interface> dst port 80` : dst (destination) to port 80

>Use to check for DNS leaks, for example:  
>`tcpdump -i <if> dst port 53`  
> and check if the DNS is the setted one

>On VPN leaks  
>`tcpdump -i <if> ppp0 -vv ip6`  
>Check for IPv6 leaks from VPN

`tcpdump -i any port 80 or port 443`
`tcpdump -i any host <toHost> and not src net <sourceReq>` : all traffic to "host IP", not comming from the "request IP"  
`tcpdump -i any dst net 192.168.0.2/24 and not src net 192.168.0.2/24` : all traffic connecting to home network, not comming from home network  
`tcpdump -i <if> -s 65535 -w file.cap` : write traffic to a file

    -s: set size of block (up to 65535 bytes per traffic, the default value is 68/96B)
    -w: file to write to

#### Where to run?
- Machine
- "Middle" machine
- Router / Firewall (best choice, because a malware can't hide from the gate to the network)
