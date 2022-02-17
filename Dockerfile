FROM debian
RUN apt update -y && apt install -y ssh wget git screen unzip
ADD bt_in.sh /bt_in.sh
RUN mkdir /run/sshd /lnmp \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && chmod 755 /bt_in.sh \
  && wget http://soft.vpser.net/lnmp/lnmp1.8.tar.gz -cO lnmp1.8.tar.gz && tar zxf lnmp1.8.tar.gz && cd lnmp1.8 && ./install.sh {lnmp|lnmpa|lamp} \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
