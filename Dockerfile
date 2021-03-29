FROM node:12-alpine

RUN apk add --no-cache git openssh-client && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config


COPY LICENSE README.md /

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
