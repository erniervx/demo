FROM ubuntu:latest

ENV SOURCE_DIR=/

COPY . $SOURCE_DIR
WORKDIR $SOURCE_DIR
RUN apt-get update && apt install -y nodejs npm python3-pip
RUN npm i -g aws-cdk
RUN pip install awscli