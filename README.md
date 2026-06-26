# IntegraVida Database - PostgreSQL

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue?logo=postgresql)
![Docker](https://img.shields.io/badge/Docker-Supported-blue?logo=docker)
![License](https://img.shields.io/badge/License-Open%20Source-green)

Solución de base de datos PostgreSQL containerizada para el proyecto IntegraVida. Este repositorio proporciona una configuración completa de Docker Compose para desplegar rápidamente una instancia de PostgreSQL con esquema preconfigurado.

## 📋 Descripción

Este proyecto facilita el despliegue de una base de datos PostgreSQL 16 mediante Docker, incluyendo:
- Configuración automatizada del ambiente
- Scripts SQL de inicialización predefinidos
- Integración sencilla con aplicaciones Spring Boot
- Gestión de datos persistentes mediante volúmenes Docker

## 🚀 Inicio Rápido

### Requisitos Previos

- **Docker** (v20.0+)
- **Docker Compose** (v2.0+)

### Instalación

1. **Levantar los contenedores**

```bash
docker compose up -d
```

2. **Verificar que los contenedores estén en ejecución**

```bash
docker ps
```

Deberías ver un contenedor de PostgreSQL ejecutándose en el puerto 5433.

## 📦 Configuración

### Variables de Entorno

Por defecto, el contenedor utiliza las siguientes credenciales (definidas en el Dockerfile):

| Variable | Valor Defecto |
|----------|--------------|
| `POSTGRES_USER` | `postgresql` |
| `POSTGRES_PASSWORD` | `302511` |
| `POSTGRES_DB` | `IntegraVida` |
| `POSTGRES_PORT` | `5432` (interno) / `5433` (host) |

### Personalización

Para cambiar las credenciales, modifica las variables de entorno en el `Dockerfile` o utiliza un archivo `.env`:

```bash
# .env
POSTGRES_USER=tu_usuario
POSTGRES_PASSWORD=tu_contraseña
POSTGRES_DB=tu_base_datos
```

## 🔧 Operaciones Comunes

### Detener los contenedores

```bash
docker compose down
```

⚠️ **Nota importante**: Este comando elimina todos los datos almacenados en la base de datos. En el siguiente inicio, se ejecutará nuevamente el script `GeneralQuery.sql`.

Para preservar los datos, utiliza:

```bash
docker compose stop
```

### Ver logs del contenedor

```bash
docker compose logs -f postgres
```

### Acceder a la base de datos directamente

```bash
docker exec -it <container_id> psql -U postgresql -d IntegraVida
```

## 🗄️ pgAdmin - Administración de Base de Datos

### Registrar el servidor PostgreSQL en pgAdmin

1. Accede a pgAdmin (generalmente en `http://localhost:5050`)
2. Crea un nuevo servidor con los siguientes parámetros:

**General**
- **Name**: PostgreSQL

**Connection**
- **Host name/address**: `localhost`
- **Port**: `5433`
- **Maintenance database**: `IntegraVida`
- **Username**: `postgresql`
- **Password**: `302511`

**Advanced** (opcional)
- **Enable SSL**: `No`

Haz clic en "Save" para completar el registro.

## 💻 Integración con Spring Boot

### Configuración de Application Properties

En tu aplicación Spring Boot, añade las siguientes propiedades en `application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5433/IntegraVida
spring.datasource.username=postgresql
spring.datasource.password=302511
spring.datasource.driver-class-name=org.postgresql.Driver

# Configuración adicional recomendada
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQL15Dialect
spring.jpa.show-sql=false
```

O con `application.yml`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5433/IntegraVida
    username: postgresql
    password: 302511
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQL15Dialect
```

### Dependencias Maven

Asegúrate de incluir el driver de PostgreSQL en tu `pom.xml`:

```xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.1</version>
</dependency>
```

## 📁 Estructura del Proyecto

```
IntegraVida-Database-PostgreSQL/
├── Dockerfile              # Configuración de la imagen Docker
├── docker-compose.yml      # Definición de servicios Docker
├── GeneralQuery.sql        # Script SQL de inicialización
└── README.md              # Este archivo
```

## 🔄 Docker Compose

El archivo `docker-compose.yml` define:
- Servicio PostgreSQL con puerto mapeado (5433 → 5432)
- Volumen persistente para datos
- Volumen para scripts de inicialización
- Red interna para comunicación entre contenedores

## 🛠️ Troubleshooting

### El puerto 5433 ya está en uso

Si recives un error sobre el puerto, cambia el mapeo en `docker-compose.yml`:

```yaml
ports:
  - "5434:5432"  # Usa el puerto 5434 en su lugar
```

### Credenciales incorrectas

Verifica que estés utilizando las credenciales definidas en el Dockerfile:
- Usuario: `postgresql`
- Contraseña: `302511`

### Volumen persistente lleno

Limpia volúmenes no utilizados:

```bash
docker volume prune
```

## 📚 Recursos Adicionales

- [PostgreSQL Documentación Oficial](https://www.postgresql.org/docs/16/)
- [Docker Compose Referencia](https://docs.docker.com/compose/compose-file/)
- [Spring Boot Database Support](https://spring.io/guides/gs/accessing-data-postgresql/)

## 📄 Licencia

Este proyecto es parte de MTS-OpenSource. Consulta el archivo LICENSE para más detalles.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📞 Soporte

Para reportar problemas o sugerencias, abre un [issue](https://github.com/MTS-OpenSource/IntegraVida-Database-PostgreSQL/issues) en el repositorio.

---

**Última actualización**: Junio 2026  
**Versión PostgreSQL**: 16  
**Estado**: Activo ✅
