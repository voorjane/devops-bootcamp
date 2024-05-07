# Отчёт по D01_LINUX

## Part 1. Установка ОС

![linux](../misc/screenshots/part1_0.jpg) \
*версия ОС*

## Part 2. Создание пользователя

1. Для создания пользователя и добавления его в группу ***adm***, введите `$ sudo useradd -G adm -m USERNAME`. Затем, введите `$ sudo passwd USERNAME` чтобы задать пароль пользователя. Теперь, введите `$ sudo usermod -s /bin/bash USERNAME` чтобы задать оболочку (для работы bash).
2. Чтобы показать всех пользователей в системе, введите `$ cat /etc/passwd`.

![useradd](../misc/screenshots/part2_0.jpg) \
*создание нового пользователя*
\
\
![printuser](../misc/screenshots/part2_1.jpg) \
*все пользователи*
\
\
![group](../misc/screenshots/part2_2.jpg) \
*новый пользователь в группе `adm`*

## Part 3. Настройка сети ОС

1. Для того чтобы поменять название машины, вам необходимо изменить его в двух файлах:
   `$ sudo vim /etc/hosts` и `$ sudo vim /etc/hostname`. Перезагрузите систему, чтобы увидеть изменения. 

   ![hostname](../misc/screenshots/part3_0.jpg) \
   *новое имя машины*

2. Чтобы установить временную зону, введите `$ sudo timedatectl set-timezone <зона>` и перезагрузите систему.
    + введите `$ timedatectl list-timezones` чтобы посмотреть доступные временные зоны

   ![date](../misc/screenshots/part3_1.jpg) \
*время по МСК*

3. Для того чтобы вывести названия сетевых интерфейсов, используйте `$ ifconfig`.

   ![ifconf](../misc/screenshots/part3_2.jpg) \
   *сетевые интерфейсы*

   >  loopback (lo) - это специальный сетевой интерфейс, который система использует для коммуникации с собой. Он используется для подключения к серверам, запущеным на этой системе. 

4. Чтобы вывести на экран ваш ip-адрес, введите `$ ifconfig | grep "inet " | grep -v 127.0.0.1`. Чтобы узнать ваш шлюз введите `$ ip route | grep default`.

   ![ipaddr](../misc/screenshots/part3_3.jpg) \
*ip адрес и шлюз*

   > DCHP (Dynamic Host Configuration Protocol - Протокол Динамической Настройки Узла) - прикладной протокол, позволяющий сетевым устройствам автоматически получать IP-адрес и другие параметры, необходимые для работы в сети TCP/IP.

5. Чтобы задать статичные настройки ip, шлюза и dns отредактируйте yaml файл в папке `/etc/netplan/`. В моем случае `$ sudo vim /etc/netplan/00-installer-config.yaml` (файл может называться иначе). Сохраните изменения командой `$ sudo netplan apply` и перезагрузите систему.
   
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
   *ip адрес и шлюз после изменений и перезагрузки системы* 
   \
   \
   ![pings](../misc/screenshots/part3_5.jpg) \
   *пинги 1.1.1.1 и ya.ru (0% потерь пакетов)*

## Part 4. Обновление ОС

Чтобы обновить системные пакеты, используйте `$ sudo apt update && sudo apt upgrade`.

![update](../misc/screenshots/part4_0.jpg) \
*система обновлена*

## Part 5. Использование команды sudo

1. Чтобы создать нового "суперпользователя", введите `$ sudo adduser USERNAME sudo`.

   >  Раньше считали, что `sudo` означает "superuser do" - суперпользователь, сделай. Но мануал линукса описывает эту команду как "substitute user, do", или "подмени пользователя и сделай".

2. Затем, выйдите из системы через `$ logout` и смените пользователя. Затем используйте пункт 3.1 для смены имени машины.

   ![sudo](../misc/screenshots/part5_0.jpg) \
   *у нового пользователя есть `sudo`*
   \
   \
   ![newhostname](../misc/screenshots/part5_1.jpg) \
   *новое имя машины*

## Part 6. Установка и настройка службы времени
Чтобы установить NTP, используйте `sudo apt-get install ntp` \
Синхронизация времени включена по умолчанию, но если нет, то используйте `$ sudo timedatectl set-ntp on`


![timeservice](../misc/screenshots/part6_0.jpg) \
*синхронизация включена*

![ntp](../misc/screenshots/part6_1.jpg) \
*NTPSynchronized=yes*

## Part 7. Установка и использование текстовых редакторов

1. VIM - `$ sudo apt install vim` 
   1. Чтобы открыть или создать файл, используйте `$ vim test_VIM.txt`. \
      \
      ![vsaved](../misc/screenshots/part7_0.jpg) \
      *для сохранения нажмите `esc + :x` или `esc + :wq`* \
      \
      ![vnotsaved](../misc/screenshots/part7_1.jpg) \
      *для отмены изменений нажмите `esc + :q!`* 
   2. Чтобы найти строку, введите `/`, а затем строку, которую необходимо найти. \
      \
      ![vfind](../misc/screenshots/part7_2.jpg) \
      *поиск слова*
   3. Чтобы найти и заменить слово используйте конструкцию `:%s/word/replace/g`, где "word" это строка, которую необходимо заменить, "replace" - на что заменить. \
      \
      ![vfindandreplace](../misc/screenshots/part7_3.jpg) \
      *поиск и замена слова*

2. NANO - `$ sudo apt install nano` 
   1. Чтобы открыть или создать файл, используйте `$ nano test_NANO.txt` \
      ![nsaved](../misc/screenshots/part7_4.jpg) \
      *чтобы сохранить и выйти, нажмите `^O + Enter + ^X` или `^O + Y`* \
      \
      ![nnotsaved](../misc/screenshots/part7_5.jpg) \
      *для отмены изменений нажмите `^X + N`*
   2. Для поиска слова нажмите `^W`, введите слово и нажмите `Enter` \
      ![nfind](../misc/screenshots/part7_6.jpg) \
      *поиск слова*
   3. Для поиска и замены слова нажмите `^/`, введите строку для замены, затем заменяющую строку, затем `Enter`. \
      ![nfindandreplace](../misc/screenshots/part7_7.jpg) \
      *поиск и замена слова*

3. MCEDIT - `$ sudo apt install mc`
   1. Чтобы открыть или создать файл, используйте `$ mcedit test_MCEDIT.txt`.
      ![msaved](../misc/screenshots/part7_8.jpg) \
      *чтобы сохранить нажмите `F2`, затем `Enter`; для выхода нажмите `F10`* \
      \
      ![mnotsaved](../misc/screenshots/part7_9.jpg) \
      *для отмены изменений нажмите `F10`, затем `No`*
   2. Для поиска слова нажмите `F7`, введите слово и нажмите `Find all`. \
      \
      ![mfind](../misc/screenshots/part7_10.jpg) \
      *поиск слова* 
   3. Для поиска и замены слова нажмите `F4`, введите строку для замены, затем заменяющую строку, затем нажмите `Ok` и `All`. \
      \
      ![mfindandreplace](../misc/screenshots/part7_11.jpg) \
      *поиск и замена слова*

## Part 8. Установка и базовая настройка сервиса **SSHD**

1. Установка OpenSSH - `$ sudo apt-get install openssh-server`.
2. Для того чтобы сервис включался при запуске системы введите `$ sudo systemctl enable ssh.service`.
3. `$ ps` показывает процессы конкретного пользователя, `$ ps -e` показывает все процессы.

   ![service](../misc/screenshots/part8_0.jpg) \
   *процесс sshd*

4. Чтобы задать порт 2022, отредактируйте файл `/etc/ssh/sshd_config`: раскомментируйте строку "Port" и задайте значение 2022. Затем, используйте `$ sudo systemctl restard sshd` чтобы подтвердить изменения` .

   ![sshdport](../misc/screenshots/part8_1.jpg) \
   *порт 2022*
   
   > Параметры: \
   > -t - TCP\
   > -a - показывает все сокеты. \
   > -n - любой адрес отображается цифрами. \
   > \
   > Столбцы: \
   > Proto - протокол, который использует сокет. \
   > Recv-Q - счётчик байт, не скопированных программой пользователя из этого сокета. \
   > Send-Q - счётчик байтов, не подтверждённых удалённым узлом.. \
   > Local Address - локальный адрес. \
   > Foreign Address - удаленный адрес. \
   > State - состояние сокета. \
   > 0.0.0.0 означает "любой доступный ipv4 адрес"

## Part 9. Установка и использование утилит **top**, **htop**

`$ sudo apt install htop`

1. top
   > Uptime - 27 min \
   > Количество авторизованных пользователей - 1 \
   > Общая загрузка системы - 0.01 \
   > Общее количество процессов - 108 \
   > Загрузка CPU - 0.2% \
   > Загрузка памяти - 202 MiB \
   > Pid процесса, занимающего больше всего памяти - 674 \
   > Pid процесса, занимающего больше всего процессорного времени - 1148
2. htop

   ![pid](../misc/screenshots/part9_0.jpg) \
   *отсортированно по PID*
   
   ![cpu](../misc/screenshots/part9_1.jpg) \
   *отсортированно по PERCENT_CPU*
   
   ![mem](../misc/screenshots/part9_2.jpg) \
   *отсортированно по PERCENT_MEM*
   
   ![time](../misc/screenshots/part9_3.jpg) \
   *отсортированно по time*
   
   ![sshdf](../misc/screenshots/part9_4.jpg) \
   *отфильтрованно для процесса sshd*
   
   ![syslog](../misc/screenshots/part9_5.jpg) \
   *syslog найден*
   
   ![outputs](../misc/screenshots/part9_6.jpg) \
   *добавлено hostname, clock и uptime*

## Part 10. Использование утилиты **fdisk**

> Название жесткого диска - /dev/sda \
> Размер - 15 GiB \
> Количество секторов - 31453184 \
> Размер swap - 0

## Part 11. Использование утилиты **df**

1. `df /`:
   > Размер раздела - 10_218_772 \
   > Занятое пространство - 3_110_816 \
   > Свободное пространство - 6_567_284 \
   > Процент использования - 33% \
   > Единицы измерения - байты

2. `df -Th /`:
   > Размер раздела - 9.8G \
   > Занятое пространство - 3.0G \
   > Свободное пространство - 6.3G \
   > Процент использования - 33% \
   > Тип файловой системы - ext4

## Part 12. Использование утилиты **du**

![du0](../misc/screenshots/part12_0.jpg) \
*вывод du*

![du1](../misc/screenshots/part12_1.jpg) \
*размеры `/home`, `/var`, `/var/log`*

![du2](../misc/screenshots/part12_2.jpg) \
*размеры всех элементов `/var/log`*

## Part 13. Установка и использование утилиты **ncdu**

`$ sudo apt intall ncdu`

![ncdu0](../misc/screenshots/part13_0.jpg) \
*размер `/home`*

![ncdu1](../misc/screenshots/part13_1.jpg) \
*размер `/var`*

![ncdu2](../misc/screenshots/part13_2.jpg) \
*размер `/var/log`*


## Part 14. Работа с системными журналами

1. `$ cat /var/log/auth.log | grep opened`
   > 17 декабря, 13:59:25, пользователь - voorjane, LOGIN(uid=0) - вход по логину и паролю.

2. `$ sudo systemctl restart sshd`

   ![restart](../misc/screenshots/part14_0.jpg) \
   *сервис перезагружен*

## Part 15. Использование планировщика заданий **CRON**

Чтобы открыть CRON, используйте `$ crontab -e`.

![cron](../misc/screenshots/part15_0.jpg) \
*CRON запускает `uptime` каждые 2 минуты*

![cronjobs](../misc/screenshots/part15_1.jpg) \
*задания CRON*

![crondel](../misc/screenshots/part15_2.jpg) \
*заданий нет*
