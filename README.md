# What is this?

This is a demo about running Symfony application with different services using kubernetes using skaffold.

This project will deploy following services:

* `nginx` for http access to Symfony REST
* `php` for running Symfony code
* `mariadb` for storing data

## Usage

Get your environment up and running using one of following options and open http://localhost:3000/task

### skaffold

```bash
# watch changes
skaffold dev

# deploy once
skaffold run

# initialize db
make db_init
```

### docker-compose
```bash
# deploy using docker-compose in detached mode
docker-compose up -d

# initialize db
docker-compose exec php ./bin/console doctrine:database:create
docker-compose exec php ./bin/console doctrine:migrations:migrate
```
