wget -O install.sh http://download.bt.cn/install/install_6.0.sh && echo y | bash install.sh
wget http://download.bt.cn/install/update/LinuxPanel-7.7.0.zip \
&& unzip LinuxPanel-7.7.0.zip \
&& cd panel \
&& bash update.sh \
&& cd .. && rm -f LinuxPanel-7.7.0.zip && rm -rf panel
rm -f /www/server/panel/data/admin_path.pl
sed -i "s|bind_user == 'True'|bind_user == 'Sakura'|" /www/server/panel/BTPanel/static/js/index.js
/usr/sbin/sshd -D
