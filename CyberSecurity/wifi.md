# Wi-Fi

## WEP
Very insecure. Password can be cracked in seconds.

Problems:

1. Use of static encryption keys - No session keys, weak RC4 used, same password for all packets
2. Lack of packet integrity assurance - Bits can be changed
3. The ineffective use of initialization vectors (IVs) - IVs not random enough, only 24-bits, IVs with the same key, crackable in seconds

## WPA
Usually uses the TKIP (Temporal Key Integrity Protocol) algorithm


>Report on cracking WPA  
>http://dl.aircrack-ng.org/breakingwepandwpa.pdf

## WPA2
Better than WPA.

Uses CCMP.

>Use it with **AES** (better than TKIP, but slower)

### WPA2 Personal (PSK - Pre-Shared Key)
Uses a password for everybody.

If used with good firmware, it might be possible to set multiple passwords, so they are not shared with all clients.

#### WPA2 Personal Mixed
Uses WPA2 + WPA, not good.

#### WPA2 Enterprise
Requires Radius Server (authentication server). This is included in dd-Wrt.
Can use EAP (Extensible Authentication Protocol) to authenticate server.

    WPA and WPA2 are susceptible to brute force attacks, so you might choose a long and complex password.

**Cowpaty** - Tool to brute force wifi password

##### MISC
SSIDs are used to create the key, so you might not choose a common SSID and put some salt on it.

    There are lists with common SSIDs and passwords to brute force the password easier.

## WPS
Uses PIN instead of the password.

Weak security: hacker can retrieve the PIN in hours with brute force attack

>Reaver - tool to attack WPS

**WPS must be OFF**

## Evil Twin AP (Access Point)
Another router with the same SSID and stronger signal. The chosen connection occurs in this router, not the real one.

    If the AP is authenticated in the client, the client can't be fooled (!)

## Untrusted networks
VPNs can be used to mitigate security issues in untrusted networks (like public wifi).

## Report
Wi-Fi security – WEP, WPA and WPA2
http://tele1.dee.fct.unl.pt/rit2_2016_2017/files/hakin9_wifi_EN.pdf

## Security Testing

`aircrack-ng`

`cowpatty` - implementation of an offline dictionary against WAP/WAP2

`reaver` - brute force attack agains WPS

`fern` - brute force attack agains WPS

## Strengthen Wifi - Secure configuration and Network isolation
1. Wifi devices should not be able to reach wired devices.
2. Have separate wifi network for devices with different network trusted levels (less trusted groups should not have outbound access to higher trusted groups of the network).
3. AP Isolation - isolates each device from each other, even if in the same network.
4. Keep routers and APs UPDATED.
5. Use custom firmware to have more options and better settings.
6. Turn off APs and any network device when not used, this reduces the attack surface.
7. Choose a random SSID or a not common one.
8. Best access control: WPA2 Enterprise with EAP (authenticate both client and server). Can use EAPOL too, more sophisticated.
9. Second best access control: WPA2 Personal with CCMP/AES.
10. Use complex and long passwords (if using WPA2 Enterprise with some other form of authentication, then it may not be need to worry about password cracking).
11. Encrypt network traffic over wireless networks (use TLS or VPN when possible).
12. Disable WPS.
13. If available on router, enable ARP spoof protection (like arpwatch).
14. Don't use Wifi if not needed.
15. Can have a VPN over all network.
16. Limit number of simultaneous connected devices (to the number of devices connected).
17. Radio frequency RF isolation and reduction methods.

		Disabling "Broadcast SSID" only hides the name from standard devices, but any wifi scanner can see it

		Filter MAC is a weak measure, because the MAC addresses can be seen by a scanner and the attacker can change his MAC address

## RF isolation and Reduction
Worried about attacker nearby.

Change the limits of network signal.

1. Change the AP location.
2. Change power output to reduce range.
3. Change anthena to direction anthena.
4. Use dampening materials to block electro-magnetic fields in and out.

## Who is on my Wifi?
1. List of connected devices on the router's admin interface
2. Applications: `whoisonmywifi`, `xirrus` (Windows), `wifi network monitor` (Windows), `GlassWire`, `Fing` (mobile), `nmap -sP|T4 <ip>/24` (-sP send ping packets, may not receive response), `arp-scan <device> <ip local network>/24` (Debian), `arp -a` (check ARP cache), `airodump-ng <device>` (list AP and connected clients), `tcpdump` (protocol analyzers)
