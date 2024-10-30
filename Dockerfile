# Use the official Tomcat base image
FROM tomcat:9.0.96

# Remove default web apps (optional if you have your own app)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/app.war

# Expose the port Tomcat is running on
EXPOSE 8080

# Start Tomcat (this is done by default in the base image)
CMD ["catalina.sh", "run"]
