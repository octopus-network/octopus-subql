# production images
FROM node:16-alpine
ENV TZ utc

ARG RELEASE_VERSION
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--", "subql-query"]

RUN npm i -g @subql/query@${RELEASE_VERSION}
