#!/bin/bash

service vsftpd start

adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/www/html/ftp
chown $FTP_USER:$FTP_USER /var/www/html/ftp
chmod 777 /var/www/html/ftp

sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/var/www/html/ftp
pasv_min_port=21100
pasv_max_port=21110
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# service vsftpd restart
service vsftpd stop

exec "$@"
