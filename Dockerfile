# Use a multi-stage build to keep the image size smaller

# Stage 1: Build the application using a Maven image
FROM maven:3.8.6-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies to cache them
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the entire project
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar demo-app.jar

# Expose the port that the Spring Boot app will run on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "demo-app.jar"]

