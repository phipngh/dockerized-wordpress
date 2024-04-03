.PHONY: install infra-build infra-up infra-stop infra-clean \
db-inside db-export db-import \
php-inside php-inside-root

-include .env

infra-build:
	docker compose up --build -d

infra-up:
	docker compose up -d

infra-stop:
	docker compose stop

infra-clean:
	docker compose down --rmi all --remove-orphans -v

php-inside-root:
	docker compose exec php sh

php-inside:
	docker compose exec --user=www-data php sh

db-inside:
	docker compose exec mariadb bash

db-export:
	docker compose exec mariadb sh -c "mysqldump -u${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > /root/${DB_NAME}.sql"
	docker compose exec mariadb sh -c "chown 1000:1000 /root/${DB_NAME}.sql"
	-mkdir -p database
	docker cp mariadb:/root/${DB_NAME}.sql database/${DB_NAME}.sql

db-import:
	cat database/${DB_NAME}.sql | docker compose exec -T mariadb /usr/bin/mysql -u ${DB_USER} --password=${DB_PASSWORD} ${DB_NAME}

install:
	docker compose exec --user=www-data -T php composer install
