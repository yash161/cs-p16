FROM node:12.11.1-alpine
WORKDIR /usr/src/app
#Based on the "How to resolve" suggestion provided by ICR, we will be updating the particular package by respective package manager.
#I will update below packages by using apk upgrade command.
#Upgrade libcrypto1.1 to >= 1.1.1k-r0
#Upgrade libssl1.1 to >= 1.1.1k-r0
#Upgrade musl to >= 1.1.20-r6
RUN apk --no-cache add libcrypto1.1=1.1.1k-r0 && apk --no-cache add libssl1.1=1.1.1k-r0
RUN apk --no-cache add musl=1.1.20-r6
COPY package*.json ./
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY server.js ./
RUN npm install
RUN npm install express@4.17.1
COPY . .
EXPOSE 8080
CMD [ "node", "server.js" ]
