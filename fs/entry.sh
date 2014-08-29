#!/bin/sh
service smb start
service nmb start

for i in $(cat /root/userlist); do
  user=${i%:*}
  pass=${i#*:}
  echo $user
  useradd $user
  echo -e "$pass\n$pass" | pdbedit -a $user -t
done

tail -f /var/log/samba/log.smbd 
