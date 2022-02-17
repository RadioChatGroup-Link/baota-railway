FROM centos
RUN yum update -y && yum install -y wget git screen unzip iproute openssh-server 
RUN mkdir /run/sshd \
  && echo "wget -O /install.sh http://download.bt.cn/install/install_6.0.sh && echo y | bash /install.sh" >> /bt_in.sh \
  && echo "rm -f /www/server/panel/data/admin_path.pl" >> /bt_in.sh \
  && echo "sed -i \"s|bind_user == 'True'|bind_user == 'Sakura'|\" /www/server/panel/BTPanel/static/js/index.js" >> /bt_in.sh \
  && echo '/usr/sbin/sshd -D' >> /bt_in.sh \
  && chmod 755 /bt_in.sh \
  && echo root:akashi520|chpasswd \
  && echo y|bash /lnmp/install_panel.sh     \
  && sh /lnmp/lib.sh     \
  && sh /lnmp/nginx.sh install 1.20     \
  && sh /lnmp/php.sh install 74     \
  && sh /lnmp/mysql.sh install 5.6     \
  && sh /lnmp/pureftpd.sh install     \
  && sh /lnmp/phpmyadmin.sh install 5.0     \
  && sh /lnmp/update6.sh     \
  && rm -rf /lnmp
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
