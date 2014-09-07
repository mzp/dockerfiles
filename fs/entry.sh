#!/bin/sh

# setup user 
for i in $(cat /root/userlist); do
  user=${i%:*}
  pass=${i#*:}
  echo $user
  adduser $user
  echo $pass | passwd --stdin $user
  echo -e "$pass\n$pass" | pdbedit -a $user -t

  # samba
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

  # AFP
  mkdir -p /export/timemachine/${user}
  chown -R $user /export/timemachine/${user}
  chmod -R 770 /export/timemachine/${user}

  cat <<END >> /etc/afp.conf
[TimeMachine for ${user}]
  path = /export/timemachine/${user}
  time machine = yes
END
done

echo

# restart service
service smb start
service nmb start
service messagebus start
service avahi-daemon start
service avahi-dnsconfd start
service netatalk start

# show logs
tail -f /var/log/samba/log.smbd 
