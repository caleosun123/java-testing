# Stage 1: Build the application with Maven
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# Run Maven to build the project
RUN mvn clean package

# Stage 2: Deploy the application
FROM tomcat:9.0.96-jdk11

# Copy the WAR file from the build stage
COPY --from=build /app/target/javatest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
