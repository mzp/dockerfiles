#!/bin/sh

# setup user 
for i in $(cat /root/userlist); do
  user=${i%:*}
  pass=${i#*:}
  echo $user
  adduser $user
  echo -e "$pass\n$pass" | pdbedit -a $user -t

  mkdir -p /export/private/${user}
  uname -a > /export/private/${user}/SAMBA_INFO
  chown -R $user /export/private/${user}

  cat <<END >> /etc/samba/smb.conf
[${user}]
  path = /export/private/${user}
  public = no
  writable = yes
  valid users = ${user}
  write list = ${user}
END

done

echo

# restart service
service smb start
service nmb start

# show logs
tail -f /var/log/samba/log.smbd 
