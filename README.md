# ergo-analytics

## To get up and running:

### Make a copy of sample.env
```
cp sample.env .env
```

### Set the API_KEY in .env to a group of strings 
```
banana apple big pear
```
### Set POSTGRES_USER and POSTGRES_PASSWORD in .env to something secure 

### Start the Nodee / Chain Grabber
```
docker-compose up -d
``` 

## To get the current info about your node:
```
docker-compose exec node info
```

## To initialize your wallet:
```
docker-compose exec node initialize
```

This will return a 15 word mnemonic seed phrase. It can only be run once.  You must copy this sentence and save it in a safe place. This sentence will be needed to restore the wallet on a different computer.

## To unlock your wallet:
```
ocker-compose exec node unlock
```

## To get all addresses of your wallet:
```
docker-compose exec node addresses
```

## To get the status of your wallet:
```
docker-compose exec node status
```

## To access Chain Grabber DB:
```
psql -U <POSTGRES_USER> explorer
```



