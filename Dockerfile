FROM btpanel/baota:lnmp
ADD bt.sh /bt.sh
RUN echo root:akashi520|chpasswd && chmod 777 /bt.sh
EXPOSE 22 3306 443 80 888 8888
ENTRYPOINT ["/bin/sh","-c","/bt.sh"]
