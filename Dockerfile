FROM bitnami/node:latest

ENV SOURCE_DIR=/

COPY . $SOURCE_DIR
WORKDIR $SOURCE_DIR

RUN npm i -g aws-cdk
RUN pip install awscli