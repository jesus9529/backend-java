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

# ENV JAVA_TOOL_OPTIONS -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n

# Exponer el puerto de la aplicación
EXPOSE 8080
EXPOSE 5005

# Configurar el comando de inicio con Spring DevTools
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev"]
# CMD ["sh", "-c", "JAVA_TOOL_OPTIONS='-agentlib:jdwp=transport=dt_socket,address=*:5005,server=y,suspend=n' ./mvnw spring-boot:run -Dspring-boot.run.profiles=dev"]
