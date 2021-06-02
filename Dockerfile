FROM onfinality/subql-node:latest

COPY . /app

WORKDIR /app
RUN yarn
RUN yarn codegen
RUN yarn build

RUN apk add --no-cache tini git
ENTRYPOINT ["/sbin/tini", "--", "subql-node"]
WORKDIR /workdir

CMD ["-f","/app"]
