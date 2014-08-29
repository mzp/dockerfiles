#!/bin/sh
service smb start
service nmb start
tail -f /var/log/samba/log.smbd 
