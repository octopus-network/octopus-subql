# production images
FROM node:14-alpine
ENV TZ utc

ARG RELEASE_VERSION
RUN apk add --no-cache tini git

RUN npm i -g @subql/node@${RELEASE_VERSION}
WORKDIR /workdir

COPY . .
RUN yarn install
RUN yarn codegen
RUN yarn build

ENTRYPOINT ["/sbin/tini", "--", "subql-node", "-f", "."]
