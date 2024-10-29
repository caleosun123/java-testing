# Use a Tomcat base image
FROM tomcat:9.0.96-jdk11

# Copy the pre-built WAR file into the Tomcat webapps directory
COPY target/javatest-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

# Expose port 8080 (default for Tomcat)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
