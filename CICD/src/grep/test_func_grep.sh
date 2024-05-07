#!/bin/bash

SUCCESS=0
FAIL=0
COUNTER=0
DIFF_RES=""

declare -a tests=(
"s test_0_grep.txt VAR"
)

testing()
{
    t=$(echo $@ | sed "s/VAR/$var/")
    ./s21_grep $t > test_s21_grep.log
    grep $t > test_sys_grep.log
    DIFF_RES="$(diff -s test_s21_grep.log test_sys_grep.log)"
    (( COUNTER++ ))
    if [ "$DIFF_RES" == "Files test_s21_grep.log and test_sys_grep.log are identical" ]
    then
      (( SUCCESS++ ))
    else
      (( FAIL++ ))
    fi
    rm test_s21_grep.log test_sys_grep.log
}

for var1 in v c n h
do
    for var2 in v c n h
    do
        if [ $var1 != $var2 ]
        then
            for i in "${tests[@]}"
            do
                var="-$var1 -$var2"
                testing "$i"
            done
        fi
    done
done

echo "Succeeded: $SUCCESS"
echo "Failed: $FAIL"

if [[ $FAIL -eq 0 ]]
then
  exit 0
else
  exit 1
fi
