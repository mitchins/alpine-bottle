from nginx:alpine

RUN apk add --no-cache uwsgi && \
    apk add --no-cache uwsgi-python3 && \
    apk add --no-cache supervisor && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python3*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install bottle && \
    rm -r /root/.cache && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S -G www-data www-data

COPY nginx.conf /etc/nginx/nginx.conf
COPY site.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf uwsgi.ini /etc/
COPY ./app /app
WORKDIR /app

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
