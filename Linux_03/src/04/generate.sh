#!/bin/bash

day=$(( $RANDOM % 26 + 1 ))
codes_arr=(200 201 400 401 403 404 500 501 502 503)
# 201 - Created — Создан новый ресурс
# 400 - Bad Request — Плохой запрос
# 401 - Unauthorized — Требуется аутентификация
# 403 - Forbidden — Ограничение в доступе
# 404 - Not Found —  Не найден
# 500 - Internal Server Error — Внутренняя ошибка сервера
# 501 - Not Implemented — Не выполненно
# 502 - Bad Gateway — Плохой шлюз
# 503 - Service Unavailable — Сервис недоступен
methods_arr=("GET" "POST" "PUT" "PATCH" "DELETE")
urls_arr=("/school21" "/voorjane" "/services" "/pedago" "/status" "/server" "/monitoring")
agent_arr=("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/2010001 Firefox/107.0" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/93.0.4585.21" "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/107.0.1418.68" "Mozilla/5.0 (compatible; MegaIndex.ru/2.0; +http://megaindex.com/crawler)" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" "Python-urllib/2.7" "Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)")
version_arr=("HTTP/1.0" "HTTP/1.1" "HTTP/2")
user_arr=("voorjane" "tarthnay" "arnellma" "polliver" "rvinnie" "amycuspy" "caedusle" "xiaoshan" "klovn" "suzuya" "nvrlukky" "admin")

for (( count = 1; count <= 5; count++ ));
do
  countStr=$(shuf -i 100-1000 -n1)
  for (( i = 0; i < countStr; i++ )); do
    codes_rand=$(( $RANDOM % 10 ))
    version_rand=$(( $RANDOM % 3 ))
    agent_rand=$(( $RANDOM % 10 ))
    methods_rand=$(( $RANDOM % 5 ))
    urls_rand=$(( $RANDOM % 7 ))
    user_rand=$(( $RANDOM % 12 ))
    ip="$(shuf -i 1-127 -n1).$(shuf -i 0-255 -n1).$(shuf -i 0-255 -n1).$(shuf -i 0-255 -n1) - "
    code="${codes_arr[codes_rand]} "
    user="${user_arr[user_rand]} - "
    method="${methods_arr[methods_rand]} "
    curdate="[$day/Sep/2023:"$(shuf -n1 -i 1-23)":"$(shuf -n1 -i 1-59)":"$(shuf -n1 -i 1-59)" +0000] "
    url="${urls_arr[urls_rand]} "
    version="${version_arr[version_rand]}"
    bytes="$(shuf -i 64-8192 -n1) "
    agent="${agent_arr[agent_rand]}"
    line="$ip$user$curdate\"$method$url$version\" $code$bytes\"-\" \"$agent\"\n"
    echo "$line" >> "$count".log
  done
  (( day++ ))
done
