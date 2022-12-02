# Global Args
ARG NODE_TAG=lts-alpine3.15

FROM node:$NODE_TAG as dist
WORKDIR /build

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#global-npm-dependencies
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN apk update && apk add --no-cache git openssh

# Install global dependencies
RUN npm install --location=global \
    semantic-release@19.0.3 \
    @semantic-release/github@8.0.7 \
    @semantic-release/changelog@6.0.0 \
    @semantic-release/git@10.0.1

ENTRYPOINT [ "semantic-release" ]
