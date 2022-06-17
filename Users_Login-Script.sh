#!/bin/bash
red='\033[0;31m';
green='\033[0;32m';
NC='\033[0m';
blue='\033[0;34m';

lastlog | grep -v "**Never logged in**" | grep -v "root"  | awk -F '\t' 'NR>1 && NF=1' | awk '{print $1,$(NF-4),$(NF-3),$(NF)}' > file.txt

threemonthago=$(date +%m --date=' 3 months ago')

date=`expr $(date '+%m')`

cat file.txt | while read -r line;

do

dt=$(echo $line | awk '{print $2,$3,$4}')

userlogdate=$(date -d "$dt" '+%m')

user=$(echo $line | awk '{print $1}')

  if [[ "$userlogdate" -gt "$threemonthago" ]]; then

     echo -e  "user $blue $user $NC is $green ACTIVE. $NC"

  else

     usermod -s /sbin/nologin $user 2> /dev/null
     echo -e "User $blue $user $NC is $red LOCKED $NC Now."

   fi

done
