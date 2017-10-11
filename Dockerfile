FROM alpine:edge

RUN set -x \
    && addgroup -g 33 -S www-data \
    && adduser -u 33 -D -S -G www-data www-data \
    && apk --no-cache add \
           php7-dom \
           php7-ctype \
           php7-fpm \
           php7-gd \
           php7-iconv \
           php7-json \
           php7-mysqli \
           php7-xml \
           php7-xmlreader \
           php7-xmlwriter \
           php7-zip \
    && rm -rf /var/cache/apk/*

COPY rootfs /

EXPOSE 9000

CMD ["php-fpm7", "-F"]
