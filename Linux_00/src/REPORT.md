# D01_LINUX Report

## Part 1. Installation of the OS

![linux](../misc/screenshots/part1_0.jpg) \
*system version*

## Part 2. Creating a user

1. To create a user and add them to ***adm*** group enter `$ sudo useradd -G adm -m USERNAME`. Then enter `$ sudo passwd USERNAME` to set password. Last, enter `$ sudo usermod -s /bin/bash USERNAME` to set shell.
2. To show all users in your system enter `$ cat /etc/passwd`.

![useradd](../misc/screenshots/part2_0.jpg) \
*creating a new user*

![printuser](../misc/screenshots/part2_1.jpg) \
*printing all users of the system*

![group](../misc/screenshots/part2_2.jpg) \
*new user is in adm group*

## Part 3. Setting up the OS network

1. To set a new machine name you have to change it in two files using text editor:
`$ sudo vim /etc/hosts` and `$ sudo vim /etc/hostname`. Reboot your system to see changes.

   ![hostname](../misc/screenshots/part3_0.jpg) \
   *new hostname*

2. To set a timezone enter `$ sudo timedatectl set-timezone <timezone>` in terminal and then reboot your system.
   + use `$ timedatectl list-timezones` to list all valid timezones

   ![date](../misc/screenshots/part3_1.jpg) \
   *Moscow timezone*

3. To output the names of the network interfaces use `$ ifconfig`.

   ![ifconf](../misc/screenshots/part3_2.jpg) \
   *network interfaces* 

   > The loopback (lo) device is a special, virtual network interface that your computer uses to communicate with itself. It is used mainly for diagnostics and troubleshooting, and to connect to servers running on the local machine. When a network interface is disconnected (Wi-Fi or Ethernet), no communication on that interface is possible, not even communication between your computer and itself. The loopback interface does not represent any actual hardware, but exists so applications running on your computer can always connect to servers on the same machine.

4. To output your ip address use `$ ifconfig | grep "inet " | grep -v 127.0.0.1`. To see your gateway use `$ ip route | grep default`.

   ![ipaddr](../misc/screenshots/part3_3.jpg) \
   *ip address and default ip (gateway)*

   > The Dynamic Host Configuration Protocol (DHCP) is a network management protocol used on Internet Protocol (IP) networks for automatically assigning IP addresses and other communication parameters to devices connected to the network using a client–server architecture.

5. To set static ip, gw and dns settings edit `/etc/netplan/` yaml file. I used `$ sudo vim /etc/netplan/00-installer-config.yaml`. Apply changes using `$ sudo netplan apply` and then reboot your system to make sure everything is saved.

   ```
   network:
      version: 2
      renderer: networkd
      ethernets:
         enp0s3:
            dhcp4: false
            addresses:
               - 192.168.31.4/24
            routes:
               - to: default
                 via: 192.168.31.1
            nameservers:
               addresses: [8.8.8.8,1.1.1.1]
      
   ```

   ![ipchange](../misc/screenshots/part3_4.jpg) \
   *ip address and gateway after changes and rebooting system*
   \
   \
   ![pings](../misc/screenshots/part3_5.jpg) \
   *1.1.1.1 and ya.ru pings (0% packet loss)*

## Part 4. OS Update

To update your system packages use `$ sudo apt update && sudo apt upgrade`.

![update](../misc/screenshots/part4_0.jpg) \
*system updated*

## Part 5. Using the sudo command

1. To create a new "sudoer" enter `$ sudo adduser USERNAME sudo`.

   >  The current Linux manual pages for su define it as "substitute user", making the correct meaning of sudo "substitute user, do", because sudo can run a command as other users as well.

2. Then, log out using `$ logout` and change user. Then follow 3.1 instructions to change hostname.

   ![sudo](../misc/screenshots/part5_0.jpg) \
   *new user has sudo*
   
   ![newhostname](../misc/screenshots/part5_1.jpg) \
   *new hostname*

## Part 6. Installing and configuring the time service
To download NTP use `sudo apt-get install ntp`. \
Time sync is on by default, but if it\`s not, use `$ sudo timedatectl set-ntp on`.


![timeservice](../misc/screenshots/part6_0.jpg) \
*sync is on*

![ntp](../misc/screenshots/part6_1.jpg) \
*NTPSynchronized=yes*

## Part 7. Installing and using text editors

1. VIM - `$ sudo apt install vim` 
   1. To open or create file enter `$ vim test_VIM.txt`.
      ![vsaved](../misc/screenshots/part7_0.jpg) \
      *to save press `esc + :x` or `esc + :wq`* \
      \
      ![vnotsaved](../misc/screenshots/part7_1.jpg) \
      *to discard changes press `esc + :q!`*
   2. To find a word enter `/` and a word after. \
      \
      ![vfind](../misc/screenshots/part7_2.jpg) \
      *find a word*
   3. To find and replace a word use a construction `:%s/word/replace/g`, where "word" is the word to replace, "replace" - a replacement. \
      \
      ![vfindandreplace](../misc/screenshots/part7_3.jpg) \
      *find and replace*
   
2. NANO - `$ sudo apt install nano`
   1. To open or create file enter `$ nano test_NANO.txt`.
      ![nsaved](../misc/screenshots/part7_4.jpg) \
      *to save and exit press `^O + Enter + ^X` or `^O + Y`* \
      \
      ![nnotsaved](../misc/screenshots/part7_5.jpg) \
      *to discard changes press `^X + N`*
   2. To find a word press `^W`, enter a word and press `Enter`. \
      \
      ![nfind](../misc/screenshots/part7_6.jpg) \
      *find a word*
   3. To find and replace a word press `^/`, then enter a word to be replaced, then a replacement, then `Enter`. \
      \
      ![nfindandreplace](../misc/screenshots/part7_7.jpg) \
      *find and replace*

3. MCEDIT - `$ sudo apt install mc`
   1. To open or create file enter `$ mcedit test_MCEDIT.txt`. \
      ![msaved](../misc/screenshots/part7_8.jpg) \
      *to save press `F2` and `Enter`; press `F10` to exit* \
      \
      ![mnotsaved](../misc/screenshots/part7_9.jpg) \
      *to discard changes press `F10` then `No`*
   2. To find a word press `F7`, enter a word and press `Find all`. \
      \
      ![mfind](../misc/screenshots/part7_10.jpg) \
      *find a word*
   3. To find and replace a word press `F4`, then enter a word to replace, then a replacement string, then press `Ok`, then `All`. \
      \
      ![mfindandreplace](../misc/screenshots/part7_11.jpg) \
      *find and replace*

## Part 8. Installing and basic setup of the **SSHD** service

1. To install OpenSSH use `$ sudo apt-get install openssh-server`.
2. To enable service on every reboot use `$ sudo systemctl enable ssh.service`.
3. `$ ps` shows processes of the current shell, `$ ps -e` shows all processes.

   ![service](../misc/screenshots/part8_0.jpg) \
   *sshd proccess*

4. To set 2022 port edit `/etc/ssh/sshd_config` file: uncomment "Port" string and set a value to 2022. Then, use `$ sudo systemctl restard sshd` to apply changes.

   ![sshdport](../misc/screenshots/part8_1.jpg) \
   *2022 port*
   
   > Options: \
   > -t - TCP.\
   > -a - Show both listening and non-listening (for TCP this means established connections) sockets. \
   > -n - Show numerical addresses instead of trying to determine symbolic host, port or user names. \
   > \
   > Columns: \
   > Proto - the protocol used by the socket. \
   > Recv-Q - the current syn backlog. \
   > Send-Q - the maximum size of the syn backlog. \
   > Local Address - address and port number of the local end of the socket. \
   > Foreign Address - address and port number of the remote end of the socket. \
   > State - the state of the socket. \
   > 0.0.0.0 means "any ipv4 address avaliable in the system".

## Part 9. Installing and using the **top**, **htop** utilities

`$ sudo apt install htop`

1. top
   > Uptime - 27 min \
   > Number of authorised users - 1 \
   > Total system load - 0.01 \
   > Total number of processes - 108 \
   > CPU load - 0.2% \
   > Memory load - 202 MiB \
   > Pid of the process with the highest memory usage - 674 \
   > Pid of the process taking the most CPU time - 1148
2. htop
   
   ![pid](../misc/screenshots/part9_0.jpg) \
   *sorted by pid*
   
   ![cpu](../misc/screenshots/part9_1.jpg) \
   *sorted by PERCENT_CPU*

   ![mem](../misc/screenshots/part9_2.jpg) \
   *sorted by PERCENT_MEM*

   ![time](../misc/screenshots/part9_3.jpg) \
   *sorted by time*

   ![sshdf](../misc/screenshots/part9_4.jpg) \
   *sshd filtered*

   ![syslog](../misc/screenshots/part9_5.jpg) \
   *syslog found*

   ![outputs](../misc/screenshots/part9_6.jpg) \
   *hostname, clock and uptime added*
   
## Part 10. Using the **fdisk** utility

> Name of the hard disk - /dev/sda \
> Capacity - 15 GiB \
> Number of sectors - 31453184 \
> Swap size - 0

## Part 11. Using the **df** utility

1. `df /`:
   > Partition size - 10_218_772 \
   > Space used - 3_110_816 \
   > Space free - 6_567_284 \
   > Percentage used - 33% \
   > Units - Bytes

2. `df -Th /`:
   > Partition size - 9.8G \
   > Space used - 3.0G \
   > Space free - 6.3G \
   > Percentage used - 33% \
   > Type - ext4

## Part 12. Using the **du** utility

![du0](../misc/screenshots/part12_0.jpg) \
*du output*

![du1](../misc/screenshots/part12_1.jpg) \
*sizes of `/home`, `/var`, `/var/log`*

![du2](../misc/screenshots/part12_2.jpg) \
*sizes of all elements of `/var/log`*

## Part 13. Installing and using the **ncdu** utility

`$ sudo apt intall ncdu` 

![ncdu0](../misc/screenshots/part13_0.jpg) \
*size of `/home`*

![ncdu1](../misc/screenshots/part13_1.jpg) \
*size of `/var`*

![ncdu2](../misc/screenshots/part13_2.jpg) \
*size of `/var/log`*


## Part 14. Working with system logs

1. `$ cat /var/log/auth.log | grep opened`
   > December 17, 13:59:25, user - voorjane by LOGIN(uid=0)

2. `$ sudo systemctl restart sshd`

   ![restart](../misc/screenshots/part14_0.jpg) \
   *service restarted*

## Part 15. Using the **CRON** job scheduler

To open CRON scheduler use `$ crontab -e`.

![cron](../misc/screenshots/part15_0.jpg) \
*CRON is running `uptime` every 2 minutes*

![cronjobs](../misc/screenshots/part15_1.jpg) \
*CRON jobs*

![crondel](../misc/screenshots/part15_2.jpg) \
*CRON is empty*
