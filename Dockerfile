FROM openjdk:8
EXPOSE 8080
ADD target/AutoMobileManagementSystem.jar AutoMobileManagementSystem.jar
ENTRYPOINT ["java","-jar","/AutoMobileManagementSystem.jar"]
