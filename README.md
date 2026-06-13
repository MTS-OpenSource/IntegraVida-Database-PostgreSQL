# Base de Datos PostgreSQL con Docker

## Requisitos

* Docker

## Levantar los contenedores

```bash
docker compose up -d
```

Verificar que los contenedores estén ejecutándose:

```bash
docker ps
```

## Detener los contenedores

```bash
docker compose down
```

Nota: Este comando elimina toda la información almacenada en la base de datos y vuelve a ejecutar el script `GeneralQuery.sql` en el siguiente inicio.

## Registrar el servidor PostgreSQL en pgAdmin

Crear un nuevo servidor con los siguientes datos:

### General

```text
Name: PostgreSQL
```

### Connection

```text
Host name/address: localhost
Port: 5433
Maintenance database: IntegraVida
Username: postgresql
Password: 302511
```

## Conexión desde Spring Boot

```properties
spring.datasource.url=jdbc:postgresql://localhost:5433/<DB_NAME>
spring.datasource.username=<DB_USER>
spring.datasource.password=<DB_PASSWORD>
spring.datasource.driver-class-name=org.postgresql.Driver
```

