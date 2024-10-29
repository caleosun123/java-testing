# Stage 1: Build the application
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Deploy the application
FROM tomcat:9.0.96-jdk11
COPY --from=build /app/target/javatest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

# Expose port 8080 (default for Tomcat)
EXPOSE 8080
