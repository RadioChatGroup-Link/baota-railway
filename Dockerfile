FROM btpanel/baota:lnmp
RUN sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
EXPOSE 22 3306 443 80 888 8888
CMD ["/bin/sh" "-c" "/bt.sh"]
HEALTHCHECK &{["CMD-SHELL" "curl -sf http://127.0.0.1:$(cat /www/server/panel/data/port.pl)/btpanel || exit 1"] "5s" "3s" "0s" '\x00'}
