FROM btpanel/baota:lnmp
RUN echo root:akashi520|chpasswd
EXPOSE 22 3306 443 80 888 8888
CMD ["/bin/sh","-c","/bt.sh"]
