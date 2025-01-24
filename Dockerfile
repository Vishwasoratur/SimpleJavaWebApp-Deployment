# Stage 1: Build the application
FROM maven:3.8.1-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml ./
COPY src ./src

# Run Maven to package the application (skip tests for faster builds)
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/*.jar demo-app.jar

# Expose the port that the Spring Boot app will run on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "demo-app.jar"]
