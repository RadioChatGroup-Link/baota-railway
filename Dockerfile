FROM centos:7.8.2003
RUN yum update -y && yum install -y wget git screen unzip iproute openssh-server 
RUN mkdir /run/sshd \
  && echo "wget -O /install.sh http://download.bt.cn/install/install_6.0.sh && echo y | bash /install.sh" >> /bt_in.sh \
  && echo "rm -f /www/server/panel/data/admin_path.pl" >> /bt_in.sh \
  && echo "sed -i \"s|bind_user == 'True'|bind_user == 'Sakura'|\" /www/server/panel/BTPanel/static/js/index.js" >> /bt_in.sh \
  && echo '/usr/sbin/sshd -D' >> /bt_in.sh \
  && chmod 755 /bt_in.sh \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
