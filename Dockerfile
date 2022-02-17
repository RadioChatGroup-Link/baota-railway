FROM btpanel/baota:lnmp
RUN sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
EXPOSE 22 3306 443 80 888 8888
CMD ["/bin/sh" "-c" "/bt.sh"]
