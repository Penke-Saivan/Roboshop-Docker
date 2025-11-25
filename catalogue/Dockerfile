FROM node:20.19.5-alpine3.22 AS build
#1st best practice- official and small image - slim/alpine
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 
#run install may add extra cache memory 

#2nd multi stage build -removes the above image when this below build is built 
FROM node:20.19.5-alpine3.22
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
USER roboshop
COPY --from=build /opt/server /opt/server 
#copied the content from previous build to final image
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
CMD ["node", "server.js"]    




#working without best practices
# FROM node:20
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node", "server.js"]    