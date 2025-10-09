
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
cp .env.sample .env
```

2. Make a copy of docker-compose.sample.yml

```bash
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