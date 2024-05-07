# Отчёт по DO2_LinuxNetwork

## Part 1. Инструмент ipcalc

### 1.1. Сети и маски

> Адрес сети 192.167.38.54/13 - 192.160.0.0

> 255.255.255.0 - двоичная: 11111111.11111111.11111111.00000000, префиксная: /24 \
> /15 - обычная: 255.254.0.0, двоичная: 11111111.11111110.00000000.00000000 \
> 11111111.11111111.11111111.11110000 - обычная: 255.255.255.240, префиксная: /28

> 12.167.38.4/8 - минимальный: 12.0.0.1, максимальный: 12.255.255.254 \
> 12.167.38.4/11111111.11111111.00000000.00000000 - минимальный: 12.167.0.1, максимальный: 12.167.255.254 \
> 12.167.38.4/255.255.254.0 - минимальный: 12.167.38.1, максимальный: 12.167.39.254 \
> 12.167.38.4/4 - минимальный: 0.0.0.1, максимальный: 15.255.255.254

### 1.2. localhost

> 194.34.23.100 - нет \
> 127.0.0.2 - да \
> 127.1.0.1 - да \
> 128.0.0.1 - нет

### 1.3. Диапазоны и сегменты сетей

> Частные: 10.0.0.45, 192.168.4.2, 172.20.250.4, 172.16.255.255, 10.10.10.10 \
> Публичные: 134.43.0.2, 172.0.2.1, 192.172.0.1, 172.68.0.2, 192.169.168.1

> 10.10.0.0/18: \
> Возможные IP: 10.10.0.2, 10.10.10.10, 10.10.1.255 \
> Невозможные IP: 10.0.0.1, 10.10.100.1

## Part 2. Статическая маршрутизация между двумя машинами

![ipa](../misc/screenshots/part2_0.jpg) \
*вывод `ip a`*

![netplanws1](../misc/screenshots/part2_1.jpg) \
*конфиг netplan у ws1*

![netplanws2](../misc/screenshots/part2_2.jpg) \
*конфиг netplan у ws2*

![netplanapply](../misc/screenshots/part2_3.jpg) \
*схема сохранена*

### 2.1. Добавление статического маршрута вручную

![route0](../misc/screenshots/part2_4.jpg) \
*команда для статического маршрута от ws1 к ws2*

![route1](../misc/screenshots/part2_5.jpg) \
*команда для статического маршрута от ws2 к ws1*

![ping0](../misc/screenshots/part2_6.jpg) \
*`ping` с ws1*

![ping1](../misc/screenshots/part2_7.jpg) \
*`ping` с ws2*

### 2.2. Добавление статического маршрута с сохранением

![newnetplanws1](../misc/screenshots/part2_8.jpg) \
*новый конфиг netplan у ws1*

![newnetplanws2](../misc/screenshots/part2_9.jpg) \
*новый конфиг netplan у ws2*

![newping0](../misc/screenshots/part2_10.jpg) \
*`ping` с ws1*

![newping1](../misc/screenshots/part2_11.jpg) \
*`ping` с ws2*

## Part 3. Утилита iperf3

Установка - `sudo apt install iperf3`.

### 3.1. Скорость соединения

> 8 Mbps - 1 MB/s \
> 100 MB/s - 819_200 Kbps \
> 1 Gbps - 1_024 Mbps \
> или: \
> 8 Mbps - 1 MB/s \
> 100 MB/s - 800_000 Kbps \
> 1 Gbps - 1_000 Mbps \

### 3.2. Утилита iperf3

Для начала, запустите сервер на первой машине используя `iperf3 -s`. Затем проверьте соединение с другой машины используя `iperf3 -t 5 -c ADDRESS`.

![0iperf3](../misc/screenshots/part3_0.jpg) \
*соединение с ws2 из ws1*

![1iperf3](../misc/screenshots/part3_1.jpg) \
*соединение с ws1 из ws2*

## Part 4. Сетевой экран

### 4.1. Утилита iptables

![ws1firewall](../misc/screenshots/part4_0.jpg) \
*фаервол ws1*

![ws2firewall](../misc/screenshots/part4_1.jpg) \
*фаервол ws2*

![ws1started](../misc/screenshots/part4_2.jpg) \
*фаервол запущен на ws1*

![ws2started](../misc/screenshots/part4_3.jpg) \
*фаервол запущен на ws2*

> Если первым написать запрещающее правило, то разрешающее правило не сработает (не перепишется)

### 4.2. Утилита nmap

![nmap](../misc/screenshots/part4_4.jpg) \
*вывод `ping` и `nmap`*

## Part 5. Статическая маршрутизация сети

### 5.1. Настройка адресов машин

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
*`ping` ws22 с ws21*

![pingws11](../misc/screenshots/part5_15.jpg) \
*`ping` r1 с ws11*

### 5.2. Включение переадресации IP-адресов.

![forw_r1](../misc/screenshots/part5_10.jpg) \
*ip forwarding на r1*

![forw_r2](../misc/screenshots/part5_11.jpg) \
*ip forwarding на r2*

![sysctl_r1](../misc/screenshots/part5_12.jpg) \
*`/etc/sysctl.conf` на r1*

![sysctl_r2](../misc/screenshots/part5_13.jpg) \
*`/etc/sysctl.conf` на r2*

### 5.3. Установка маршрута по-умолчанию

![defws11](../misc/screenshots/part5_16.jpg) \
*маршрут по умолчанию на ws11*

![defws11](../misc/screenshots/part5_17.jpg) \
*маршрут по умолчанию на ws21*

![iprws11](../misc/screenshots/part5_18.jpg) \
*маршрут по умолчанию на ws22*

![iprws11](../misc/screenshots/part5_19.jpg) \
*вывод `ip r` на ws11*

![iprws11](../misc/screenshots/part5_20.jpg) \
*вывод `ip r` на ws21*

![iprws11](../misc/screenshots/part5_21.jpg) \
*вывод `ip r` на ws22*

![pingws11r2](../misc/screenshots/part5_22.jpg) \
*`ping` r2 с ws11*

![dumpr2](../misc/screenshots/part5_23.jpg) \
*вывод `tcpdump`*

### 5.4. Добавление статических маршрутов

![r1conf](../misc/screenshots/part5_24.jpg) \
*конфиг r1*

![r2conf](../misc/screenshots/part5_25.jpg) \
*конфиг r2*

![iprr1](../misc/screenshots/part5_26.jpg) \
*вывод `ip r` на r1*

![iprr2](../misc/screenshots/part5_27.jpg) \
*вывод `ip r` на r2*

![iprlistws11](../misc/screenshots/part5_28.jpg) \
*вывод `ip r list` на ws11*

> При наличии двух и более маршрутов выбирается маршрут с самой длинной маской т.к. он более точный

### 5.5. Построение списка маршрутизаторов

![tracertws11](../misc/screenshots/part5_29.jpg) \
*вывод `traceroute` на ws11*

![tcpdmpr1](../misc/screenshots/part5_30.jpg) \
![tcpdmppr1](../misc/screenshots/part5_31.jpg) \
*вывод `tcpdump` на r1*

> `traceroute` посылает 3 пакета, каждый раз увеличивая значение TTL(time-to-live) на единицу, пока не дойдет до конца

### 5.6. Использование протокола ICMP при маршрутизации

![tcpdmp56](../misc/screenshots/part5_32.jpg) \
*вывод `tcpdump` на r1*

![iprlistws11](../misc/screenshots/part5_33.jpg) \
*вывод `ping` на ws11*

## Part 6. Динамическая настройка IP с помощью DHCP

![dhcpd](../misc/screenshots/part6_0.jpg) \
*содержание `/etc/dhcp3/dhcpd.conf` на r2*

![resolv](../misc/screenshots/part6_1.jpg) \
*содержание `/etc/resolv.conf` на r2*

![dhcprestart](../misc/screenshots/part6_2.jpg) \
*перезапуск сервиса dhcp*

![ipa6](../misc/screenshots/part6_3.jpg) \
*вывод `ip a`*

![ping6](../misc/screenshots/part6_4.jpg) \
*вывод `ping`*

![ws11conf](../misc/screenshots/part6_5.jpg) \
*конфиг на ws11*

![dhcpdr1](../misc/screenshots/part6_6.jpg) \
*содержание `/etc/dhcp3/dhcpd.conf` на r2*

![resolvr1](../misc/screenshots/part6_7.jpg) \
*содержание `/etc/resolv.conf` на r1*

![dhcprestartr1](../misc/screenshots/part6_8.jpg) \
*перезапуск сервиса dhcp на r1*

![ws11ipa6](../misc/screenshots/part6_9.jpg) \
*вывод `ip a` на ws11*

![ws11ping](../misc/screenshots/part6_10.jpg) \
*вывод `ping` на ws11*

![ws11ipa6](../misc/screenshots/part6_11.jpg) \
*ip до*

![ws11ping](../misc/screenshots/part6_12.jpg) \
*ip после*

> Я использовал `sudo dhclient -r` и `sudo dhclient -v` для выдачи ip, а для самого конфига \
> использовались параметры routers и domain-name-servers

## Part 7. NAT

![apws22](../misc/screenshots/part7_0.jpg) \
*порты apache на ws22*

![apr1](../misc/screenshots/part7_1.jpg) \
*порты apache на r1*

![apacws22](../misc/screenshots/part7_2.jpg) \
*apache запущен на ws22*

![apacr1](../misc/screenshots/part7_3.jpg) \
*apache запущен на r1*

![firewalr2](../misc/screenshots/part7_4.jpg) \
*фаерволл на r2*

![frwstart](../misc/screenshots/part7_5.jpg) \
*фаервол запущен*

![pingws22r1](../misc/screenshots/part7_6.jpg) \
*`ping` не работает*

![firewallr2](../misc/screenshots/part7_7.jpg) \
*icmp разрешен*

![frwstart2](../misc/screenshots/part7_8.jpg) \
*фаервол запущен*

![newpingws22r1](../misc/screenshots/part7_9.jpg) \
*`ping` теперь работает*

![dnatsnat](../misc/screenshots/part7_10.jpg) \
*добавлены DNAT и SNAT*

![frwstart3](../misc/screenshots/part7_11.jpg) \
*фаервол запущен*

![telnetws22](../misc/screenshots/part7_12.jpg) \
*`telnet` с ws22*

![telnetr1](../misc/screenshots/part7_13.jpg) \
*`telnet` с r1*

## Part 8. Дополнительно. Знакомство с SSH Tunnels

![frwstart4](../misc/screenshots/part8_0.jpg) \
*фаервол запущен*

![localapache](../misc/screenshots/part8_1.jpg) \
*apache перенастроен на localhost*

![apcstarted](../misc/screenshots/part8_2.jpg) \
*apache запущен*

![localssh](../misc/screenshots/part8_3.jpg) \
*локальное подключение к ws22 с ws21*

![tltws21](../misc/screenshots/part8_4.jpg) \
*`telnet` с ws21 до ws22*

![remotessh](../misc/screenshots/part8_5.jpg) \
*удаленное подключение к ws22 с ws11*

![tltws11](../misc/screenshots/part8_6.jpg) \
*`telnet` с ws11 до ws22*

> ty for review <3
