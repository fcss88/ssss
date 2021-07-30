FROM alpine:latest
RUN apk update && apk add apache2
RUN echo '<html><head><title>web server startup page</title></head><body><h1>Hello world<h1></body></html>' > /var/www/localhost/htdocs/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
