# Use an OpenJDK base image
FROM openjdk:8

# Set the working directory inside the container
WORKDIR /app

# Copy the WAR file from the host machine to the container
COPY target/AutoMobileManagementSystem-0.0.1-SNAPSHOT.war /app

# Expose the port your application listens on
EXPOSE 8080

# Command to run your application when the container starts
CMD ["java", "-jar", "AutoMobileManagementSystem-0.0.1-SNAPSHOT.war"]
