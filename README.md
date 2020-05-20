# Rails 6 API APP, Docker, Devise JWT

### Technologies used

- Ruby 2.7.1
- Rails 6.0.3

### Initial Project Setup

  1. Install [Docker Desktop](https://www.docker.com/p2.roducts/docker-desktop)

  2. Install [docker-compose](https://docs.docker.com/compose/install/)

  3. Copy .env.example to .env and change default variables values

  4. Bootstrap a docker container, run `docker-compose up`

  5. Create `secrets.yml.enc`, run `docker-compose exec api_app rails credentials:edit`

  6. Create and migrate database, run `docker-compose exec api_app rails db:setup`

  7. Restart docker container
