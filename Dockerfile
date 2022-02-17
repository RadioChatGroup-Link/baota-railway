FROM centos:centos7
ADD bt_in.sh /bt_in.sh
RUN yum update -y && yum install -y ssh wget git screen unzip
RUN mkdir /run/sshd /lnmp \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && echo y | bash install.sh \
  && wget -O /lnmp/lnmp.tar.gz https://pan.yropo.workers.dev/source/lnmp.tar.gz \
  && cd /lnmp && tar -zxvf lnmp.tar.gz \
  && chmod 755 /bt_in.sh \
  && echo y|bash /lnmp/lib.sh     \
  && echo y|bash /lnmp/nginx.sh install 1.20     \
  && echo y|bash /lnmp/php.sh install 74     \
  && echo y|bash /lnmp/mysql.sh install 5.6     \
  && echo y|bash /lnmp/pureftpd.sh install     \
  && echo y|bash /lnmp/phpmyadmin.sh install 5.0     \
  && rm -rf /lnmp \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
