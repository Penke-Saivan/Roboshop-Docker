FROM maven:3.9.11
EXPOSE 8080
WORKDIR /opt/server
COPY pom.xml .
COPY src ./src 
# if it folder you are coying just be noted like above
RUN mvn clean package
RUN mv target/shipping-1.0.jar shipping.jar
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
CMD ["java","-jar","shipping.jar"]