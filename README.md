based on https://github.com/webdevops/TYPO3-docker-boilerplate

# URL

local:
```
t3solr.dev:8080
```

## Setup

### Requirements
```
docker
make
composer
docker-compose
```

### First time setup
```
make create typo3
```
Go to t3solr.dev:8080/typo3 and set up typo3 with the following db details:
```
user: dev
pass: dev
host: mysql
port: 3306
```
Use existnig database `typo3`
```
make up
```
You will need to add the following entry to `/etc/hosts` file:
```
127.0.0.1       t3solr.dev
```
Solr is available on localhost at port `8989` (in docker network it uses standard `8983` port)
