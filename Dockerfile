FROM mcr.microsoft.com/azure-cli:latest

LABEL "com.github.actions.name"="HTML Reporter AWS S3 Upload"
LABEL "com.github.actions.description"="Upload HTML Test Results to an AWS S3 repository"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1"
LABEL repository="https://github.com/PavanMudigonda/html-reporter-s3-website"
LABEL homepage="https://abcd.guru/"
LABEL maintainer="Pavan Mudigonda <mnpawan@gmail.com>"

RUN apk update && \
    apk add --no-cache bash wget unzip && \
    rm -rf /var/cache/apk/* && \
    apk --no-cache add jq

ENV ROOT=/app

RUN mkdir -p $ROOT

WORKDIR $ROOT

COPY ./entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

