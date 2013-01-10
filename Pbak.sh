#!/bin/bash
#机器名
Pro_host=`hostname`
#日期标识
bak_date=`date +%Y%m%d`
#本地源文件位置
src_dir="/var/www/"
ftp_dir="7D/b4/$Pro_host"
#FTP站点相关信息
u_name=$1
u_pass=$2
ftp_domain=$3

#备份
cd $src_dir
tar --exclude=logs -zcf $Pro_host.$bak_date.tar.gz ./

#上传文件到ftp
ftp -v -n  $ftp_domain <<EOF
user $u_name $u_pass
binary
hash
mkdir $ftp_dir
cd $ftp_dir
lcd $src_dir
prompt
mput *.tar.gz
bye
EOF

