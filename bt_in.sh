wget -O install.sh http://download.bt.cn/install/install_6.0.sh && echo y | bash install.sh
rm -f /www/server/panel/data/admin_path.pl 
/usr/sbin/sshd -D
