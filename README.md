# VeVeTo

Management system of the HPBV for all administrative tasks.
Programmed by DaluMa Websolutions.

## docker-compose workflow

VeVeTo uses a docker-compose workflow that sets up a LEMP network of containers for local development. 


#### Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Open a terminal and run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see the VeVeTo app running as intended. 

The following containers that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates inside your project root.

~~~~
docker-compose run --rm composer update
docker-compose run --rm npm run dev
docker-compose run --rm artisan migrate
~~~~ 

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`
- **phpMyAdmin** - `:8082`
- **MailDev** - `:8081`
- **npm**
- **composer**
- **artisan**

## Set up local development environment

For this tutorial i will use my bash alias as described below.

1. Clone or download this repository. Ideally somewhere where docker has write access. For example in the `/Users` directory. _(macOS)_
2. Set up docker as described above and go to your project root. _(The directory in which the `docker-compose.yml` is located)_
3. Open a browser of your choice and go to the following URL: [http://localhost:8080](http://localhost:8080)
4. The first thing we need to take care of is to install Composer. To do this, run `dcr install composer`
5. Next, copy the `.env.example` and delete the word `.example` from the file name. So that you only have one `.env`.
6. Now we have to create a key for the `.env`. To do this, execute the following command: `dca key:generate`
7. Next, run `dcr npm install` to install all packages from the `package.json`
8. The last thing we need to do is migrate the database. To do this, run the following command: `dca migrate —seed`

Maybe this process is uncompleted. If so please let me know and i will take care of it.

## Sensible shell alias (zsh)

- **dc** - `docker-compose`
- **dcr** - `docker-compose run --rm`
- **dca** - `docker-compose run --rm artisan`

To use it put the following into your `~/.zshrc`:

~~~~
alias dc="docker-compose"
alias dcr="docker-compose run --rm"
alias dca="docker-compose run --rm artisan"
~~~~

I'm pretty sure you can use it in every other shell in a similar way.

## Install Laravel Telescope

Laravel Telescope is an elegant debug assistant for the Laravel framework. Telescope provides insight into the requests coming into your application, exceptions, log entries, database queries, queued jobs, mail, notifications, cache operations, scheduled tasks, variable dumps and more. Telescope makes a wonderful companion to your local Laravel development environment.

Telescope is preconfigured, if you wanne use it execute the following commands.

~~~~
1. dca telescope:install
2. dca migrate
~~~~

You can reach telesope at the following URL: [http://localhost:8080/telescope](http://localhost:8080/telescope)