FROM alpine:latest

# download and install nginx
RUN set -ex && \
    apk update -f && \
    apk --no-cache add -f nginx openssl coreutils curl socat && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /run/nginx && \
    # remove useless files
    for f in $(find /etc/nginx -type f ! -path "*mime.types"); do rm -rf $f; done

# copy custom configurations
COPY config /etc/nginx

# install and configure acme client
RUN curl https://get.acme.sh | sh && \
    ln -s ~/.acme.sh/acme.sh /usr/local/bin/acme.sh && \
    export AWS_ACCESS_KEY_ID="AAAAAAAAAAAAAAAAAA" && \
    export AWS_SECRET_ACCESS_KEY="BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" && \
    acme.sh --issue --server https://acme-staging-v02.api.letsencrypt.org/directory --dns dns_aws -d dev.jaylabs.io -d *.dev.jaylabs.io && \
    ln -s ~/.acme.sh/dev.jaylabs.io /certs

# change workdir to nginx config folder
WORKDIR "/etc/nginx"

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

# default command
CMD ["nginx"]