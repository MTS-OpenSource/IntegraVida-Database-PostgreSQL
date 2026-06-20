FROM postgres:16

COPY GeneralQuery.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

CMD ["postgres"]
