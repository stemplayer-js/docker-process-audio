FROM jrottenberg/ffmpeg:4.1-alpine as ffmpeg

RUN apk update && \
    apk add lame bash

COPY stem.sh /usr/local/bin/stem
RUN chmod +x /usr/local/bin/stem

WORKDIR /workdir

CMD [ "-help" ]
ENTRYPOINT ["/usr/local/bin/stem"]