FROM node:14-alpine as install
ARG PROJECT="marketplace-webapp"
LABEL project="$PROJECT"
RUN [ "mkdir", "/workspace" ]
WORKDIR /workspace
VOLUME [ "/workspace" ]
COPY package*.json .
RUN [ "yarn", "install" ]

FROM node:14-alpine
ARG PROJECT="marketplace-webapp"
WORKDIR /workspace
COPY --from=install /workspace /workspace
VOLUME [ "/workspace" ]
CMD [ "yarn", "run", "build" ]