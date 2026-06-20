FROM postgres:16

ENV POSTGRES_USER=postgresql
ENV POSTGRES_PASSWORD=302511
ENV POSTGRES_DB=IntegraVida

COPY GeneralQuery.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

CMD ["postgres"]
