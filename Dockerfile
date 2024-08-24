# Use a Maven image with Java 21 to build the project
FROM maven:3.9.5-eclipse-temurin-21 AS build

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the pom.xml file and install dependencies
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the entire project
COPY . .

# Package the application (skip tests to speed up the build)
RUN mvn clean package -DskipTests

# Use Eclipse Temurin for Java 21 as the base image for the application
FROM eclipse-temurin:21-jre-jammy

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the JAR file from the Maven build stage
COPY --from=build /app/target/spring-chat-app-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]