
# Wordpress-Bedrock-Docker

This repository is a containerized wordpress bedrock containing php-fpm, mysql, and nginx.


## Environment Variables

To run this project, you will need to do the following:

1. Make a copy of .env.sample

```bash
cp .env.sample .env
```

2. Make a copy of docker-compose.sample.yml

```bash
cp docker-compose.sample.yml docker-compose.yml
```

3. Edit .env and docker-compose.yml to configure the database and secrets.



## Deployment

To deploy this project run

```bash
  docker compose up -d
```

To stop the application run 

```bash
  docker compose down
``` 