FROM node:alpine3.20

WORKDIR /tmp

COPY . .

EXPOSE 3001/udp

ENV SERVER_PORT=3001

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
