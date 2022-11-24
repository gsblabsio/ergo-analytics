# ergo-analytics

The essentials for a blockchain analyst or data scientist who want to extract insights from the Ergo network using Docker.

## Quickstart

### Create a .env file
```
cp sample.env .env
```

### Update .env config variables

> Note: POSTGRES and READONLY variables are only used when postgres starts the first time.

```
# node settings
API_KEY=

# explorer config
POSTGRES_USER=ergo
POSTGRES_PASSWORD=changeme
READONLY_USER=readonly_user
READONLY_PASSWORD=readonly
```

### Start the Node & Chain Grabber
```
docker-compose up -d
``` 

## Commands

### Current info about your node
```
docker-compose exec node info
```

### Initialize node wallet
```
docker-compose exec node initialize
```

This will return a 15 word mnemonic seed phrase. It can only be run once.  You must copy this sentence and save it in a safe place. This sentence will be needed to restore the wallet on a different computer.

### Unlock wallet
```
docker-compose exec node unlock
```

### Retrieve all wallet addresses
```
docker-compose exec node addresses
```

### Wallet status
```
docker-compose exec node status
```

### Access Chain Grabber DB (add -p <port> if port changed)
```
psql -U <POSTGRES_USER> explorer
```

### View web UI
* Open a browser and go to http://localhost/panel

## Troubleshooting

### Upgrading node

```
docker pull ergoplatform/ergo:latest
docker-compose stop 
docker-compose build node
docker-compose up -d
```

### Upgrading chain grabber

```
vi .env # update EXPLORER_VERSION to new version
docker-compose stop 
docker-compose build chain-grabber
docker-compose up -d
```

### If Postgres port 5432 is already in use...

Change the port for the postgres service in `docker-compose.yml`.  For example, 5433:5432 will expose it as 5433 locally (it will remain 5432 internally).

```
    ports:
      - "5433:5432"
```

### If port 80 is already in use...

Change the port for the node service in the `docker-compose.yml` file.  For example, 8080:9053 would expose it as 8080.

```
    ports:
      - "8080:9053"
```
