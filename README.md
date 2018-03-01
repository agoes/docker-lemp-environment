# Docker LEMP environment

Simple LEMP environment **for development purpose** using docker and docker-compose. It inspired from Laravel Homestead and Laradock.

## Features
- It using Alpine linux for all docker images
- Default lemp stack (nginx, php, mariadb)
- Xdebug
- Multiple virtual hosts
- `docker-compose` wrapper using `lempctl`

## Installation
- Install docker https://docs.docker.com/install/
- Install docker-compose https://docs.docker.com/compose/install/
- Download the latest release https://github.com/agoes/docker-lemp-environment/releases or `git clone https://github.com/agoes/docker-lemp-environment.git`
- Enter `docker-lemp-environment` `cd docker-lemp-environment/`
- Inside `docker-lemp-environment` directory, run `./lempctl init`

## Workspace
Your applications / websites should be placed at `code` directory that placed in environment root directory. For example if you have project folder `laravelapp` it should be located at `code/laravelapp`

## `sites.sh`
 This file is located in the environment root directory. It is for mapping hostname and public directory / index file location

 ### Add new site
- Open `sites.sh`
- Add `SITES[yourapp.local]=[code/yourapp/public/directory]`
- Save that file and run `./lempctl reload-vhost`
- Dont forget to map IP of `yourapp.local` in your `/etc/hosts`. You can use [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) or [acrylic dns (windows)](http://mayakron.altervista.org/wikibase/show.php?id=AcrylicHome) for better host mapping.

## lempctl command usage
This command is located at environment root directory.

```sh
./lempctl [COMMAND]
```

```
Available commands :
  init                   Build and start docker-compose services
  rebuild-all            Rebuild all service images and containers. All of your data will be cleaned up.
  reload-vhost           Reload available virtual hosts that defined in sites.sh
  restart                Restart docker-compose services
  start                  Start all services in docker-compose and reload all virtual hosts
  stop                   Stop all docker-compose containers
  workspace              Enter workspace container
```
Notes : For Windows user, please use WSL to run `lempctl` command.

## License
[MIT License](LICENSE)
