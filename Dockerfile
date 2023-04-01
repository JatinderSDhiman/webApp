# Use a Java runtime image as the base image
FROM openjdk:17-jdk

# Set the working directory to /app
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/webApp-0.0.1-SNAPSHOT.jar /app

# Run the JAR file when the container starts
CMD ["java", "-jar", "webApp-0.0.1-SNAPSHOT.jar"]