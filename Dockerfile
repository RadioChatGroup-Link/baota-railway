FROM debian
ADD bt_in.sh /bt_in.sh
RUN apt update -y && apt install -y ssh wget git screen unzip
RUN mkdir /run/sshd \
  && chmod 755 /bt_in.sh \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
