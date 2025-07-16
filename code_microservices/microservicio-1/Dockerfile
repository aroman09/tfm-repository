# Etapa 1: Construcción
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copia el código fuente y pom.xml
COPY . .

# Usa Maven directamente si ya está instalado en la imagen
RUN mvn clean package -DskipTests

# Etapa 2: Imagen final
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copia el JAR desde la etapa de construcción
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
