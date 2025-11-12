
# FROM postgis/postgis:18-3.6
FROM imresamu/postgis-arm64:16-3.4-alpine-ver20251012-1a93697-2025w46

ENV POSTGRES_USER=postgresuser 
ENV POSTGRES_DB=live-ddos-db
ENV POSTGRES_PASSWORD=mypassword

COPY init.sql /docker-entrypoint-initdb.d/


