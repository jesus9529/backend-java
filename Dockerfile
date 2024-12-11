# FROM maven:3.9.5-eclipse-temurin-17
# # Set the working directory inside the container
# WORKDIR /app

# # Copy the pom.xml and the source code to the working directory
# COPY . .

# # Run the Spring Boot application with DevTools enabled
# CMD ["mvn", "spring-boot:run", "-Dspring-boot.run.profiles=dev", \
#      "-Dspring.devtools.restart.enabled=true", \
#      "-Dspring.devtools.livereload.enabled=true", \
#      "-Dspring.devtools.remote.secret=mysecret"]

# Imagen base de desarrollo
FROM eclipse-temurin:17-jdk-alpine as base

# Crear un directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios para instalar dependencias
COPY pom.xml mvnw ./
COPY .mvn .mvn

# Instalar las dependencias de Maven (caché)
RUN ./mvnw dependency:resolve

# Copiar el código fuente
COPY src ./src

# Exponer el puerto de la aplicación
EXPOSE 8080

# Configurar el comando de inicio con Spring DevTools
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev"]
