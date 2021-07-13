FROM httpd:2.4
FROM node:14-alpine AS builder

RUN mkdir /home/build/

# Copy our application to the image.
COPY application /home/build
COPY package.json /home/build
COPY webpack.config.js /home/build

COPY ./application/public /usr/local/apache2/htdocs/
WORKDIR /usr/local/apache2/htdocs/
