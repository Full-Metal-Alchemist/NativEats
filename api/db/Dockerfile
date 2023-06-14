FROM postgis/postgis:15-3.3
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB nativeats
COPY schema.sql /docker-entrypoint-initdb.d/