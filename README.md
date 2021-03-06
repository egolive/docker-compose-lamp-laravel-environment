![Build](https://github.com/egolive/docker-compose-lamp-laravel-environment/workflows/Build/badge.svg)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/egolive/StrapDown.js/graphs/commit-activity) [![GitHub issues](https://img.shields.io/github/issues/egolive/docker-compose-lamp-laravel-environment.svg)](https://GitHub.com/egolive/docker-compose-lamp-laravel-environment/issues/) [![GitHub release](https://img.shields.io/github/release/egolive/docker-compose-lamp-laravel-environment.svg)](https://GitHub.com/egolive/docker-compose-lamp-laravel-environment/releases/) [![GitHub license](https://img.shields.io/github/license/egolive/docker-compose-lamp-laravel-environment.svg)](https://github.com/egolive/docker-compose-lamp-laravel-environment/blob/master/LICENSE)

# docker-compose-lamp-laravel-environment

A docker-compose workflow that sets up a LAMP software bundle of containers for local development.

#### Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Open a terminal and run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost](http://localhost) and you should see the your app running as intended. 

Containers created and their ports (if used) are as follows:

- **apache** - `80:80`
- **mysql** - `:3306`
- **phpMyAdmin** - `:8080`
- **MailHog** - `:8025`

## Set up local development environment

1. Clone or download this repository. Ideally somewhere where docker has write access. For example in the `/Users/*` directory. _(macOS)_
2. Go to your root directory and the `/docker/` directory in it.  _(The directory in which the `docker-compose.yml` is located)_. Open a terminal and run `docker-compose up -d --build`.
3. Open a browser of your choice and go to the following URL: [http://localhost](http://localhost). You should see your app running as intended. 
4. Now we need to open a shell at the web server. To do this, go back to your terminal and run `docker-compose exec development bash`. It should be noted at this point that we communicate with the web server via Docker. That means to talk to the web server we use the `docker-compose.yml`. To do this we have to be in the `/docker/` directory in which the `docker-compose.yml` is located. 
5. The first thing we need to take care of is to install Composer. To do this, run `install composer`
6. Next, copy the `.env.example` and delete the word `.example` from the file name. So that you only have one `.env`.
7. Now we have to create a key for the `.env`. To do this, execute the following command: `php artisan key:generate`
8. Next, run `npm install` to install all packages from the `package.json`
9. The last thing we need to do is migrate the database. To do this, run the following command: `php artisan migrate —seed`

Maybe this process is uncompleted. If so please let me know and i will take care of it.

## Install Laravel Telescope

Laravel Telescope is an elegant debug assistant for the Laravel framework. Telescope provides insight into the requests coming into your application, exceptions, log entries, database queries, queued jobs, mail, notifications, cache operations, scheduled tasks, variable dumps and more. Telescope makes a wonderful companion to your local Laravel development environment.

Telescope is preconfigured, if you wanne use it execute the following commands.

~~~~
1. php artisan telescope:install
2. php artisan migrate
~~~~

You can reach telesope at the following URL: [http://localhost/telescope](http://localhost/telescope)

## Sensible shell aliases (zsh)

- **dc** - `docker-compose`
- **dce** - `docker-compose exec development bash`

To use it put the following into your `~/.zshrc`:

~~~~
alias dc="docker-compose"
alias dce="docker-compose exec development bash"
~~~~

I'm pretty sure you can use it in every other shell in a similar way.

## Credits

This project is based on florian dehn's php docker runtime:
[https://github.com/katzefudder/docker_php_runtime](https://github.com/katzefudder/docker_php_runtime)
