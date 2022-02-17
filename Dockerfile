FROM centos:7.8.2003
ADD bt_in.sh /bt_in.sh
RUN yum update -y && yum install -y wget git screen unzip iproute openssh-server 
RUN mkdir /run/sshd \
  && chmod 755 /bt_in.sh \
  && echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD /bt_in.sh
