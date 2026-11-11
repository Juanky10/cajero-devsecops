# Etapa 1: Compilar el código Java
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Etapa 2: Imagen de producción
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copiamos solo el ejecutable, dejando atrás el código fuente
COPY --from=builder /app/target/cajero-1.0-SNAPSHOT.jar ./cajero.jar
EXPOSE 8080
CMD ["java", "-jar", "cajero.jar"]