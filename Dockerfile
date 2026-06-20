FROM postgres:16

# The official Postgres image uses /docker-entrypoint-initdb.d/ 
# to run any .sql or .sh scripts on startup when the data directory is empty.
COPY GeneralQuery.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5432
