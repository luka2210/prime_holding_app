FROM openjdk:17.0.2-jdk
RUN mkdir -p /home/app
WORKDIR /home/app
COPY . /home/app
RUN ./mvnw clean
ENTRYPOINT ["./mvnw",  "spring-boot:run"]
