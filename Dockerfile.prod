# Etapa 1: Construcción
FROM maven:3.9.5-eclipse-temurin-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml y descarga las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia todo el código fuente
COPY . .

# Compila el proyecto y genera el JAR
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:17-jre-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia el JAR desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto del servidor
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
