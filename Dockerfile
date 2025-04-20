
# Base image: Using Eclipse Temurin JDK 17 with Alpine Linux for a minimal footprint
FROM eclipse-temurin:17-jdk-alpine
    
# Inform Docker that the container will listen on port 8080 at runtime
EXPOSE 8080

# Execute 'ls' command during image build to list directory contents
# Note: This is likely unnecessary and can be removed for production
RUN ls 

# Set environment variable APP_HOME to define application directory
ENV APP_HOME=/usr/src/app

# Copy all JAR files from local 'app' directory to container's APP_HOME directory
# and rename it to app.jar
COPY app/*.jar ${APP_HOME}/app.jar

# Set the working directory to APP_HOME for subsequent commands
WORKDIR ${APP_HOME}

# Define the command to run the Java application when container starts
# Uses the 'java -jar' command to execute the app.jar
CMD ["java", "-jar", "app.jar"]
