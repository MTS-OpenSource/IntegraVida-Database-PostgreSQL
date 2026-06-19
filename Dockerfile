# Utilizar la imagen oficial de PostgreSQL versión 16
FROM postgres:16

# Configurar las variables de entorno para el usuario, contraseña y base de datos
ENV POSTGRES_USER=postgresql
ENV POSTGRES_PASSWORD=302511
ENV POSTGRES_DB=IntegraVida

# Copiar el script SQL de inicialización al directorio de entrypoint
COPY GeneralQuery.sql /docker-entrypoint-initdb.d/

# Exponer el puerto estándar de PostgreSQL
EXPOSE 5432
