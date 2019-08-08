### Firewall accept or deny traffic

Most work on *transport (layer 4)* or *network (layer 3)* layers to accept or reject based on PORT, PROTOCOL and ADDRESS.

Advanced firewall works on *application (layers 5-7)* layers.

### Ingress/Inbound filtering

Internet can't communicate directly with internal addresses because of NAT, unless it is set port forward or DMZ.

#### Host based firewalls
The client device has it's own firewall (Windows firewall, iptables). Protect from undesired connection from a shared network (not protected by NAT).

Should deny all external traffic connecting inbound.

**Disadvantage:** is in the same platform it is protecting. If infected, the malware could just disable the firewall or use trusted application to communicate out.

**Advantage:** can use the application layer.

### Egress/Oubound filtering

**Shell code (reverse shell/connection)**  
Code designed specifically to connect out and gain remote control. 

Reverse shell often creates a shell code (terminal).

### Network isolation
Isolates devices from each other on a shared network, so it don't propagates a malware to other devices on the network

## Network based firewall
Acts on the connection between the internal network and the internet.

May not protect from malicious traffic occuring in trusted ports (like HTTP, HTTPS..), but might be configured to work on the application layer.

## Virtual firewall
Might have another machine working as firewall (dedicated machine or VM, pfsense)

## Rule #1
All network should be DENIED if not explicit ALLOWED.

> - Block IPv6
> - Block UPnP 1900
> - Block IGMP
> - Block any Windows, Mac OS X, Linux services that are not used

#### Dynamic Packet Filtering / Stateful Packet Inspection (SPI)
Only needs to allow outgoing packages, not inbound traffic, because the router remembers the used port for the response.

## Linux - host firewall
All recent kernel use netfilter system. Needs user interface, iptables is one of these.

`iptables -L`  
Common chains: INPUT, FORWARD, OUTPUT.

iptables try each rule in order, it it don't find any matching rule it uses de default policy.

#### Policies
ACCEPT - accept connection
DROP - timeout connection
REJECT - send response with rejection

#### Close all ports
This will let the computer connects to established connections and accept localhost traffic

`iptables -F` : Delete all rules

`iptables -P INPUT ACCEPT|DROP|REJECT`

    Close all connection using DROP for all chains

`iptables -A INPUT -i lo -j ACCEPT`  
Add rule to INPUT chain for localhost to accept

    -v : verbose  
    --line-number : show rule number  
    -n : don't resolve names

`iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT`

**Dynamic packet filtering rule**  
By using this rule it is possible to use a connection and receive a response back, because the connection was already established

>-m : loads a module (in this case 'state')  
>
>The states can be:  
>**NEW:** new incomming packages that weren't initiated by the host system  
>**RELATED, ESTABLISHED:** packages already part of a established connection

`iptables -A OUTPUT -i lo -j ACCEPT`  
Accepts that applications use the output to localhost

`iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT`  
**Dynamic packet filtering rule** for outbound 

#### Access the intert
To access the internet after setting this rules.

`iptables -A OUTPUT -o <device> -p udp -m udp --dport 53 -j ACCEPT`  
For DNS responses

`iptables -A OUTPUT -o <device> - p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT`
For HTTP connections

`iptables -A OUTPUT -o <device> - p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT`
For HTTPS connections

    `iptables -S`: see the inputed rules commands

#### Save the rules
`/sbin/iptables-save`

#### Delete rule
`iptables -L --line-number`

`iptables -D <chain> <line-number>`

    `-X`: delete user defined chains

>**iptables** is for IPv4  
>**ip6tables** is for IPv6

Most people don't use IPv6, so you might set DROP for default policy

#### Useful link for iptables

Simple config  
http://tech.meetrp.com/blog/iptables-personal-firewall-to-protect-my-laptop/

Script to configure firewall (iptables)  
https://github.com/meetrp/personalfirewall

Definitive guide  
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html

### Interfaces
**UFW**  
Firewall interface for iptables  

`ufw status`  
`ufw status numbered`  
`ufw status verbose`  
`ufw enable`  
`ufw default deny incoming`  
`ufw allow out 22`  
`ufw deny in 22`  
`ufw allow out 67:68/udp`  

These add IPv4 and IPv6.

To change it edit `/etc/default/ufw`, set `IPV6=no`.

**Shorewall**

**gufw**  
Graphical interface

There is a whole lot of GUIs and Frontends for iptables.

>netfilter don't work with application layer.

### Misc
`nftables` - Next iptables (under development). Includes:

- `arptables` - maintain the ARP
- `ebtables` - filter tables for bridges
- and more tools...

### Is the firewall worth the trouble?
Maybe. It don't protects against malware that is already inside the computer, since it may bypass it, but it protects from untrusted devices on the same network.

# Network based Firewalls
The primary place to use network based firewall is the Router.

You may use dedicated firewall devices or dedicated virtual devices (a PC working as a firewall).

### pfsense
Custom firewall application based on FreeBSD that is installed on a PC that works as a firewall device (as an OS), not on a router.

Can be used as firewall and router.

Lot's of features and customization (Torify all traffic).

### opnsense and smoothwall
Based on pfsense

### vyos 
Better for network engineers, used to Cisco CLI (or something like that).

## Good to use?
For home inbound traffic, NAT provides the needed security.

For outbound it may prevent unwanted traffic, close ports, reject application connections, monitor traffic.

It can't protect against malware that uses open ports, since they are trusted by the firewall. But with application firewall it may block this traffic.

Good for network isolation.
