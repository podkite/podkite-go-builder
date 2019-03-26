FROM golang:1.10.3-alpine

ARG TERRAFORM_VERSION=0.11.13

RUN apk --no-cache add make git zip curl

RUN go get -u github.com/golang/dep/cmd/dep

RUN curl -O https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/
