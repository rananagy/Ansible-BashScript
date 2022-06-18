#!/bin/bash
red='\033[0;31m';
green='\033[0;32m';
NC='\033[0m';
blue='\033[0;34m';

lastlog | grep -v "**Never logged in**" | grep -v "root"  | awk -F '\t' 'NR>1 && NF=1' | awk '{print $1,$(NF-4),$(NF-3)}' > file.txt

last | grep -v "root" | grep -v "reboot" | grep -v "wtmp" |  awk '{print $1}' | sort -u > Remove_Dupl.txt


cat Remove_Dupl.txt | while read -r line;

do

last | grep -w "$line" | head -1  | grep -v "root" | awk '{print $1,$(NF-5),$(NF-4)}' >> file.txt

done




threemonthago=$(date +%m --date=' 3 months ago')


date=`expr $(date '+%m')`

cat file.txt | while read -r line;

do

dt=$(echo $line | awk '{print $2,$3,$4}')

userlogdate=$(date -d "$dt" '+%m')

user=$(echo $line | awk '{print $1}')

check_user=$(grep -w $user /etc/passwd)

id_user=$(id -u $user)

  if [[ "$userlogdate" -gt "$threemonthago" ]]; then

        echo -e  "user $blue $user $NC is $green ACTIVE. $NC"

  elif [[ "$check_user" != "" && "id_user" -lt "60000" ]]; then

    #local users

     usermod -s /sbin/nologin $user 2> /dev/null

     echo -e "User $blue $user $NC is $red LOCKED $NC Now."

      else

     #IPA Users

          if [[ "$id_user" -gt "60000" ]]; then

           rm -rf /home/$user

            echo -e "Homedir Of $blue $user $NC is $red DELETED $NC Now."


           fi
     fi
   fi
done
