
# Wordpress-Bedrock-Docker

This repository is a containerized wordpress bedrock containing php-fpm, mysql, and nginx.


## Tech Stack

| **Package** | **Version** |
|-------------|-------------|
| php-fpm     | 8.3         |
| mysql       | 8.4         |
| nginx       | latest      |


## Environment Variables

To run this project, you will need to do the following:

1. Make a copy of .env.sample

```bash
cd ./bedrock
cp .env.sample .env
```

2. Make a copy of docker-compose.sample.yml

```bash
cd ..
cp docker-compose.sample.yml docker-compose.yml
```

3. Edit .env and docker-compose.yml to configure the database and secrets.


## Run Locally

Clone the project

```bash
git clone https://github.com/veenoise/wordpress-bedrock-docker.git
```

Go to the project directory

```bash
cd wordpress-bedrock-docker
```

Run the docker compose

```bash
docker compose up -d
```

Open the browser to port 8080

http://localhost:8080

If you're done, you can stop the docker compose and your changes would still persist

```bash
docker compose stop
```

## Configuration

#### Modifying configs

You can modify the `./nginx/` and `./php-etc/` directories while the containers are running and the changes would apply to the containers immediately.

`./nginx/conf.d/default.conf` holds the site nginx config and `./nginx/nginx.conf` has the nginx global config.

`./php-etc/php/php.ini` holds the config for the php and `./php-etc/php-fpm.d/www.conf` holds the fpm pool config.

#### Applying configs, restarting services, and executing commands

To see running containers

```bash
docker ps
```

Sample output

```bash
CONTAINER ID   IMAGE                          COMMAND                  CREATED         STATUS         PORTS                                     NAMES
f7d236bd886b   nginx:latest                   "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   wordpress-bedrock-docker-nginx-1
b5bcd45f3936   wordpress-bedrock-docker-php   "docker-php-entrypoi…"   8 seconds ago   Up 7 seconds   9000/tcp                                  wordpress-bedrock-docker-php-1
3bf0684f6c50   mysql:8.4                      "docker-entrypoint.s…"   8 seconds ago   Up 7 seconds   3306/tcp, 33060/tcp                       wordpress-bedrock-docker-db-1
```

To restart service

```bash
docker restart <container-name>
```

To execute container command

```bash
docker exec <container name> <command>
```

For example

```bash
docker exec wordpress-bedrock-docker-nginx-1 nginx -s reload
```