FROM alpine

RUN apk add --update git python \
    && rm -rf /var/cache/apk/*

RUN mkdir /opt \
    && cd /opt \
    && git clone https://github.com/RuudBurger/CouchPotatoServer.git

EXPOSE 5050

WORKDIR /opt

VOLUME "/var/couchpotato"

ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py", "--data_dir=/var/couchpotato"]