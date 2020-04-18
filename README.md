# VeVeTo
docker-compose workflow that sets up a LEMP network of containers for local VeVeTo development. 


## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Open a terminal and run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see the VeVeTo app running as intended. 

The following containers that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate` 

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`
- **phpMyAdmin** - `:8082`
- **MailDev** - `:8081`
- **npm**
- **composer**
- **artisan**

## Sensible shell alias

- **dc** - `docker-compose`
- **dcr** - `docker-compose run --rm`
- **dca** - `docker-compose run --rm artisan`

To use it put the following into your `~/.zshrc`:

`alias dc="docker-compose"`

`alias dcr="docker-compose run --rm"`

`alias dca="docker-compose run --rm artisan"`

## Install Laravel Telescope

Laravel Telescope is an elegant debug assistant for the Laravel framework. Telescope provides insight into the requests coming into your application, exceptions, log entries, database queries, queued jobs, mail, notifications, cache operations, scheduled tasks, variable dumps and more. Telescope makes a wonderful companion to your local Laravel development environment.

Telescope is preconfigured, if you wanne use it execute the following commands.


1. `dca telescope:install`
2. `dca migrate`