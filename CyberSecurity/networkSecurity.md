# Router

default router: `route -n`

Passwords DB: `routerpasswords.com`

### Router parts
- Swtich devices

      It uses the MAC addresses of each port to the specific client, so it's not possible to sniff the connection (solves Isolated Collision Domain)
- Firewall

      Allow or deny traffic based on a set of rules. Log traffic if configured to do so. iptables commonly is used as the firewall on routers.
- Routers

      Route traffic between nodes (iptables)
- Modem

      Modulate and demodulate signal so it can be passed to the local route, works with fotons and electrons from the internet
- Wireless Access Point

      As a switch, uses MAC addresses to send traffic. Broadcasts the traffic

Routers also uses DHCP, DNS.

## Vulnerabilities

https://www.shodan.io (Google of vulnerabilities / IoT)  
Searches for vulnerable devices on the internet

`ssh root@<device_ip>` << Login on router

`netstat tunl` << get open ports (most local)

> Windows: Use PuTTY fro ssh connection to the router

https://pentest-tools.com/home  
https://mxtoolbox.com  
https://grc.com/shieldsup  
https://www.qualys.com/forms/freescan (more detailed)  
Scan for open ports

## NMAP, MBSA...

`nmap`  
Port scanning

`cat /var/log/syslog | grep dhcp`  
Check if Automatic DHCP is enabled, but it is easier going to the network devices settings on the OS GUI

`ip a show <device>`  
Shows information about the device

Then with the ip address to scan, run `nmap -T4 -F xxx.xxx.xxx.<IP_range>/<subnet>`

    nmap [OPTIONS] ...

    -T4: Timing template (faster than default T3)
    -F: Fast mode (scans the 100 most common ports instead of the defaul 1000)
    -v: Verbose
    -A: OS scanning

**Fing**  
Application from smartphones

**openvas**  
Vulnerability scanner application.  
Initialize it with Kali, then start it and access the address with the browser.

**Nessus home**  
Demo of Nessus. It scans the personal home network for vulnerability scan (the leading application for this)

**Qualys**  
Also does vulnerability scan

> I can run these application with root authentication, setting the SSH Credetial. Have in minde that **openvas** is not so well consistent as Nessus or Qualys (which are payed), so it might change configurations of the device.

### Router Firmwares

The OS running on the router is known as firmware. Manufacturers don't let the firmware easy to use or to customize, so we might install a custom firmware, which has might have these advantages:

- VPN's
- VLAN's
- iptables / pfsense
- Isolated Wifi
- Live traffic monitoring
- Torify all traffic
- Logging...

Search for the right custom firmware for the router.

**OpenWrt**  
Linux distribution for embeded devices. Is a framework to build custom firmwares.  
Might use with **gargoyle-router** (easier interface)

**libreCMC**
Based on OpenWrt. Set of fully free embedded Operating Systems for general purpose computers. Not for begginers.

**dd-wrt**
Easier to use, lots of features, compatible with less devices than OpenWrt

smallnetbuilder.com  
Router benchmark
