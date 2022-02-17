FROM debian
RUN apt update -y && apt install -y ssh wget git screen unzip curl
ADD bt_in.sh /bt_in.sh
RUN mkdir /run/sshd /lnmp \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && chmod 755 /bt_in.sh \
  && wget -O btlnmp.sh https://pan.yropo.workers.dev/source/sh/btlnmp.sh && bash btlnmp.sh \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
