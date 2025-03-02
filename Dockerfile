# Use Maven with JDK
FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app

# Copy only pom.xml first and install dependencies (caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the rest of the application
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]