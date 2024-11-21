# migrate.Dockerfile
FROM migrate/migrate:v4.15.2
COPY ./migrations /migrations
ENTRYPOINT ["migrate", "-path", "/migrations", "-database", "mysql://root:root@tcp(mysql:3306)/orders", "up"]
