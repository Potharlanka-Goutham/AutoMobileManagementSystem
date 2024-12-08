FROM adoptopenjdk/openjdk11
LABEL maintainer="test_user@gmail.com"
EXPOSE 8080
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
