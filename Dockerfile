# syntax=docker/dockerfile:1

#FROM gradle:7.1.0-jdk16 AS build-image
#
#COPY . /app
#WORKDIR /app
#
#RUN gradle --no-daemon build

FROM openjdk:16-alpine3.13
EXPOSE 8080

#COPY --from=build-image app/build/libs/gradle-java-dockerization-1.0-SNAPSHOT.jar app.jar
COPY app/build/libs/gradle-java-dockerization-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
