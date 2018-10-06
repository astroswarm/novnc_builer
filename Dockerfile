ARG ARCH

FROM astroswarm/base-$ARCH:latest

RUN apt-get -y update
RUN apt-get -y install \
  git \
  nginx

WORKDIR /tmp
RUN git clone https://github.com/novnc/noVNC.git
WORKDIR /tmp/noVNC
RUN git reset --hard d1050405813412a684636522f8daddb5ad913fe2

RUN cp -rf ./app /var/www/html/app
RUN cp -rf ./core /var/www/html/core
RUN cp -rf ./vendor /var/www/html/vendor
RUN cp -f vnc.html /var/www/html/vnc.html
RUN cp -f vnc_lite.html /var/www/html/vnc_lite.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
