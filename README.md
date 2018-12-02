# What is this?

This is a demo about running Symfony application with different services using kubernetes using skaffold.

This project will deploy following services:

* `nginx` for http access to Symfony REST
* `php` for running Symfony code
* `mariadb` for storing data

## Usage

```bash
# deploy to kubernetes and keep watching changes
skaffold dev

# deploy to kubernetes once
skaffold run

# deploy using docker-compose in detached mode
docker-compose up -d
```
