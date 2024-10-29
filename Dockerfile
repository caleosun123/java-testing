# Use the official Tomcat 9 base image with JDK 11
FROM tomcat:9.0.96-jdk11

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Copy the WAR file from the target directory to the Tomcat webapps directory
COPY target/javatest-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/app.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
