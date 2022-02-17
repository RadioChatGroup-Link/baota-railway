FROM btpanel/baota:lnmp
RUN yum update && yum install wget -y \
  && sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js \
  && wget -O /install.sh http://download.bt.cn/install/install_6.0.sh
EXPOSE 22 3306 443 80 888 8888
CMD echo -e "3\n" | bt
