FROM golang:1.10.3-alpine

ARG TERRAFORM_VERSION=0.11.13
ARG FLYWAY_VERSION=5.2.4

RUN apk --no-cache add make git zip curl \
    ansible bash openjdk8 nss

RUN go get -u github.com/golang/dep/cmd/dep

RUN curl -O https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/

RUN curl -O https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    tar xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    rm flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    ln -s `pwd`/flyway-${FLYWAY_VERSION}/flyway /usr/local/bin/flyway
