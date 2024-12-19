# Imagen base de desarrollo
FROM eclipse-temurin:17-jdk-alpine

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
EXPOSE 5005

# Configurar el comando de inicio con Spring DevTools
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev", "-Pdebug"]
# CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev", "-Dspring-boot.run.jvmArguments=\"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=*:5005\""]