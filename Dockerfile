FROM nginx:alpine
LABEL maintainer "Ziyu Wang <odduid@gmail.com>"

RUN mv /etc/nginx /etc/nginx-previous

COPY server-configs-nginx /etc/nginx

RUN ln -s /var/log/nginx /etc/nginx/logs \
      && addgroup -S www \
      && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www www
