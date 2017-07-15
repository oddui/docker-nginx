FROM nginx:alpine
LABEL maintainer "Ziyu Wang <odduid@gmail.com>"


COPY sites /sites


RUN apk --no-cache add git \
      \
      # Use h5bp/server-configs-nginx as the base for nginx configs
      && mv /etc/nginx /etc/nginx-previous \
      && git clone https://github.com/h5bp/server-configs-nginx.git /etc/nginx \
      \
      && addgroup -S www \
      && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www www \
      && ln -s /var/log/nginx /etc/nginx/logs \
      \
      && echo "ssl_certificate /certs/ziyus-ca/default.crt;" >> /etc/nginx/h5bp/directive-only/ssl.conf \
      && echo "ssl_certificate_key /certs/ziyus-ca/default.key;" >> /etc/nginx/h5bp/directive-only/ssl.conf \
      && cd /etc/nginx/sites-enabled \
      && ln -s /sites/default \
      && ln -s /sites/durarara.me \
      && ln -s /sites/chat.durarara.me \
      && ln -s /sites/server.local
