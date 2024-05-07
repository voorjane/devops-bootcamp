# DO2_LinuxNetwork Report

## Part 1. ipcalc tool

### 1.1. Networks and Masks

> Network address of 192.167.38.54/13 - 192.160.0.0/13 

> 255.255.255.0 - binary: 11111111.11111111.11111111.00000000, prefix: /24 \
> /15 - normal: 255.254.0.0, binary: 11111111.11111110.00000000.00000000 \
> 11111111.11111111.11111111.11110000 - normal: 255.255.255.240, prefix: /28

> 12.167.38.4/8 - min: 12.0.0.1, max: 12.255.255.254 \
> 12.167.38.4/11111111.11111111.00000000.00000000 - min: 12.167.0.1, max: 12.167.255.254 \
> 12.167.38.4/255.255.254.0 - min: 12.167.38.1, max: 12.167.39.254 \
> 12.167.38.4/4 - min: 0.0.0.1, max: 15.255.255.254

### 1.2. localhost

> 194.34.23.100 - no \
> 127.0.0.2 - yes \
> 127.1.0.1 - yes \
> 128.0.0.1 - no 

### 1.3. Network ranges and segments

> Private: 10.0.0.45, 192.168.4.2, 172.20.250.4, 172.16.255.255, 10.10.10.10
> Public: 134.43.0.2, 172.0.2.1, 192.172.0.1, 172.68.0.2, 192.169.168.1

> 10.10.0.0/18: \
> Possible IPs: 10.10.0.2, 10.10.10.10, 10.10.1.255
> Impossible IPs: 10.0.0.1, 10.10.100.1

## Part 2. Static routing between two machines

![ipa](../misc/screenshots/part2_0.jpg) \
*`ip a` output*

![netplanws1](../misc/screenshots/part2_1.jpg) \
*ws1 netplan config*

![netplanws2](../misc/screenshots/part2_2.jpg) \
*ws2 netplan config*

![netplanapply](../misc/screenshots/part2_3.jpg) \
*netplan applied*

### 2.1. Adding a static route manually

![route0](../misc/screenshots/part2_4.jpg) \
*ws1 command to route with ws2*

![route1](../misc/screenshots/part2_5.jpg) \
*ws2 command to route with ws1*

![ping0](../misc/screenshots/part2_6.jpg) \
*`ping` with ws1*

![ping1](../misc/screenshots/part2_7.jpg) \
*`ping` with ws2*

### 2.2. Adding a static route with saving

![newnetplanws1](../misc/screenshots/part2_8.jpg) \
*new ws1 netplan config*

![newnetplanws2](../misc/screenshots/part2_9.jpg) \
*new ws2 netplan config*

![newping0](../misc/screenshots/part2_10.jpg) \
*`ping` with ws1*

![newping1](../misc/screenshots/part2_11.jpg) \
*`ping` with ws2*

## Part 3. iperf3 utility

To install use `sudo apt install iperf3`.

### 3.1. Connection speed

> 8 Mbps - 1 MB/s \
> 100 MB/s - 819_200 Kbps \
> 1 Gbps - 1_024 Mbps \
> or: \
> 8 Mbps - 1 MB/s \
> 100 MB/s - 800_000 Kbps \
> 1 Gbps - 1_000 Mbps \

### 3.2. iperf3 utility

First, start a server on one machine using `iperf3 -s`. Then check connection from other machine using `iperf3 -t 5 -c ADDRESS`.

![0iperf3](../misc/screenshots/part3_0.jpg) \
*ws1 to ws2 connection*

![1iperf3](../misc/screenshots/part3_1.jpg) \
*ws2 to ws1 connection*

## Part 4. Network firewall

### 4.1. iptables utility

![ws1firewall](../misc/screenshots/part4_0.jpg) \
*ws1 firewall*

![ws2firewall](../misc/screenshots/part4_1.jpg) \
*ws2 firewall*

![ws1started](../misc/screenshots/part4_2.jpg) \
*firewall started on ws1*

![ws2started](../misc/screenshots/part4_3.jpg) \
*firewall started on ws2*

> If deny rule is written first, then the allow rule can`t be overwritten

### 4.2. nmap utility

![nmap](../misc/screenshots/part4_4.jpg) \
*`ping` and `nmap` output*

## Part 5. Static network routing

### 5.1. Configuration of machine addresses

![ws11](../misc/screenshots/part5_0.jpg) \
*ws11*

![ws21](../misc/screenshots/part5_1.jpg) \
*ws21*

![ws22](../misc/screenshots/part5_2.jpg) \
*ws22*

![r1](../misc/screenshots/part5_3.jpg) \
*r1*

![r2](../misc/screenshots/part5_4.jpg) \
*r2*

![ipws11](../misc/screenshots/part5_5.jpg) \
*ws11*

![ipws21](../misc/screenshots/part5_6.jpg) \
*ws21*

![ipws22](../misc/screenshots/part5_7.jpg) \
*ws22*

![ipr1](../misc/screenshots/part5_8.jpg) \
*r1*

![ipr2](../misc/screenshots/part5_9.jpg) \
*r2*

![pingws21](../misc/screenshots/part5_14.jpg) \
*`ping` ws22 from ws21*

![pingws11](../misc/screenshots/part5_15.jpg) \
*`ping` r1 from ws11*

### 5.2. Enabling IP forwarding.

![forw_r1](../misc/screenshots/part5_10.jpg) \
*ip forwarding on r1*

![forw_r2](../misc/screenshots/part5_11.jpg) \
*ip forwarding on r2*

![sysctl_r1](../misc/screenshots/part5_12.jpg) \
*`/etc/sysctl.conf` on r1*

![sysctl_r2](../misc/screenshots/part5_13.jpg) \
*`/etc/sysctl.conf` on r2*

### 5.3. Default route configuration

![defws11](../misc/screenshots/part5_16.jpg) \
*route to default on ws11*

![defws11](../misc/screenshots/part5_17.jpg) \
*route to default on ws21*

![iprws11](../misc/screenshots/part5_18.jpg) \
*route to default on ws22*

![iprws11](../misc/screenshots/part5_19.jpg) \
*`ip r` output on ws11*

![iprws11](../misc/screenshots/part5_20.jpg) \
*`ip r` output on ws21*

![iprws11](../misc/screenshots/part5_21.jpg) \
*`ip r` output on ws22*

![pingws11r2](../misc/screenshots/part5_22.jpg) \
*`ping` r2 from ws11*

![dumpr2](../misc/screenshots/part5_23.jpg) \
*`tcpdump` output*

### 5.4. Adding static routes

![r1conf](../misc/screenshots/part5_24.jpg) \
*r1 config*

![r2conf](../misc/screenshots/part5_25.jpg) \
*r2 config*

![iprr1](../misc/screenshots/part5_26.jpg) \
*`ip r` output on r1*

![iprr2](../misc/screenshots/part5_27.jpg) \
*`ip r` output on r2*

![iprlistws11](../misc/screenshots/part5_28.jpg) \
*`ip r list` output on ws11*

> If there is two or more routes the one with the longest mask is chosen as it is more accurate 

### 5.5. Making a router list

![tracertws11](../misc/screenshots/part5_29.jpg) \
*`traceroute` output on ws11*

![tcpdmpr1](../misc/screenshots/part5_30.jpg) \
![tcpdmppr1](../misc/screenshots/part5_31.jpg) \
*`tcpdump` output on r1*

> `traceroute` sends 3 packets, each time increasing the TTL (time-to-live) value until it reaches the target

### 5.6. Using ICMP protocol in routing

![tcpdmp56](../misc/screenshots/part5_32.jpg) \
*`tcpdump` output on r1*

![iprlistws11](../misc/screenshots/part5_33.jpg) \
*`ping` output on ws11*

## Part 6. Dynamic IP configuration using DHCP

![dhcpd](../misc/screenshots/part6_0.jpg) \
*r2 `/etc/dhcp3/dhcpd.conf` content*

![resolv](../misc/screenshots/part6_1.jpg) \
*r2 `/etc/resolv.conf` content*

![dhcprestart](../misc/screenshots/part6_2.jpg) \
*dhcp service restart*

![ipa6](../misc/screenshots/part6_3.jpg) \
*`ip a` output*

![ping6](../misc/screenshots/part6_4.jpg) \
*`ping` output*

![ws11conf](../misc/screenshots/part6_5.jpg) \
*ws11 config*

![dhcpdr1](../misc/screenshots/part6_6.jpg) \
*r1 `/etc/dhcp3/dhcpd.conf` content*

![resolvr1](../misc/screenshots/part6_7.jpg) \
*r1 `/etc/resolv.conf` content*

![dhcprestartr1](../misc/screenshots/part6_8.jpg) \
*dhcp service restart on r1*

![ws11ipa6](../misc/screenshots/part6_9.jpg) \
*`ip a` output on ws11*

![ws11ping](../misc/screenshots/part6_10.jpg) \
*`ping` output on ws11*

![ws11ipa6](../misc/screenshots/part6_11.jpg) \
*ip before update*

![ws11ping](../misc/screenshots/part6_12.jpg) \
*ip after update*

> I used `sudo dhclient -r` and `sudo dhclient -v` to get ip \
> and "routers" and 'domain-name-servers' as DHCP options

## Part 7. NAT

![apws22](../misc/screenshots/part7_0.jpg) \
*apache ports on ws22*

![apr1](../misc/screenshots/part7_1.jpg) \
*apache ports on r1*

![apacws22](../misc/screenshots/part7_2.jpg) \
*apache started on ws22*

![apacr1](../misc/screenshots/part7_3.jpg) \
*apache started on r1*

![firewalr2](../misc/screenshots/part7_4.jpg) \
*firewall on r2*

![frwstart](../misc/screenshots/part7_5.jpg) \
*firewall started*

![pingws22r1](../misc/screenshots/part7_6.jpg) \
*`ping` does not work*

![firewallr2](../misc/screenshots/part7_7.jpg) \
*icmp allowed*

![frwstart2](../misc/screenshots/part7_8.jpg) \
*firewall started*

![newpingws22r1](../misc/screenshots/part7_9.jpg) \
*`ping` works now*

![dnatsnat](../misc/screenshots/part7_10.jpg) \
*two more rules added*

![frwstart3](../misc/screenshots/part7_11.jpg) \
*firewall started*

![telnetws22](../misc/screenshots/part7_12.jpg) \
*`telnet` from ws22*

![telnetr1](../misc/screenshots/part7_13.jpg) \
*`telnet` from r1*

## Part 8. Bonus. Introduction to SSH Tunnels

![frwstart4](../misc/screenshots/part8_0.jpg) \
*firewall started*

![localapache](../misc/screenshots/part8_1.jpg) \
*apache configured on localhost*

![apcstarted](../misc/screenshots/part8_2.jpg) \
*apache started*

![localssh](../misc/screenshots/part8_3.jpg) \
*local connection to ws22 from ws21*

![tltws21](../misc/screenshots/part8_4.jpg) \
*`telnet` from ws21 to ws22*

![remotessh](../misc/screenshots/part8_5.jpg) \
*remote connection to ws22 from ws11*

![tltws11](../misc/screenshots/part8_6.jpg) \
*`telnet` from ws11 to ws22*

> ty for review <3