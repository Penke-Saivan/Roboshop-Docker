FROM node:20.19.5-alpine3.22 AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 

FROM node:20.19.5-alpine3.22
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
EXPOSE 8080
LABEL com.projects="roboshop" \
      component="user" \
      created_by="satya"
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/users" \
    REDIS_URL="redis://redis:6379"
     
COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server
USER roboshop 
CMD ["node", "server.js"]  





# FROM node:20
# EXPOSE 8080
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/users" \
#     REDIS_URL="redis://redis:6379"
# CMD ["node", "server.js"]    