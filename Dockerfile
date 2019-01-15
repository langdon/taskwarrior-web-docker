FROM alpine:3.5

LABEL maintainer="Julien Mercier-Rojas <julien@jeckel-lab.fr>"

RUN apk add --no-cache ruby ruby-bundler ruby-dev build-base task bash && \
    gem install --no-ri --no-rdoc taskwarrior-web && \
    apk del ruby-bundler ruby-dev build-base

COPY ./docker-entrypoint.sh /
COPY ./wait-for-it.sh /

# Configure container
VOLUME ["/root/.task"]

ENV CLIENT_CERT_PATH /root/.task/client

ENTRYPOINT /wait-for-it.sh ${TASKD_SERVER} -- /docker-entrypoint.sh
EXPOSE 5678
