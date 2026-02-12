FROM busybox:stable-musl

WORKDIR /home/static

COPY . .

CMD ["httpd", "-f", "-p", "80", "-h", "/home/static"]