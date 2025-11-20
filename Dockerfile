ARG ALPINE_VERSION=3.22
FROM alpine:${ALPINE_VERSION}

# Install packages
RUN apk add --no-cache \
  tzdata \
  spawn-fcgi

COPY /root /

STOPSIGNAL SIGQUIT

CMD ["/usr/bin/spawn-fcgi", "-s /var/run/nginx-auth/sock -M 666 -n /usr/bin/nginx-auth /config/nginx-auth.conf"]
