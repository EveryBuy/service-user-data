FROM ubuntu:20.04 AS build

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk

COPY . .

RUN chmod +x gradlew
RUN ./gradlew build

FROM openjdk:17-alpine

COPY --from=build /build/libs/service-authority-0.0.1.jar /app/service-authority-0.0.1.jar

CMD ["java", "-jar", "app/service-authority-0.0.1.jar"]

