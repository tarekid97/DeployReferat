# Stufe 1: JAR mit Maven bauen (Tests laufen in der CI)
FROM maven:3-eclipse-temurin-21 AS build
WORKDIR /src
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

# Stufe 2: schlankes JRE-Image
FROM eclipse-temurin:21-jre
ARG APP_VERSION=dev
ENV APP_VERSION=${APP_VERSION}
WORKDIR /app
COPY --from=build /src/target/app.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
