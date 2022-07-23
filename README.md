# ergo-analytics

To get up and running:
* Copy sample.env to .env: cp sample.env .env.
* Set API_KEY in .env to a group of strings like banana apple big pear.
* SET POSTGRES_USER and POSTGRES_PASSWORD in .env to something secure.
* Change the EXPLORER_VERSION in .env, if desired.
* If you already have Postgres running locally, change the port for the postgres service in docker-compose.yml.  For example, 5433:5432 will expose it as 5433 locally (it will remain 5432 internally).
* Similarly, if you already have something running on port 80, change the port for the node service.  For example, 8080:9053 would expose it as 8080.
* Start the Node / Chain Grabber: docker-compose up -d

To get the current info about your node:
* docker-compose exec node info

To initialize your wallet:
* docker-compose exec node initialize

This will return a 15 word mnemonic seed phrase. It can only be run once.  You must copy this sentence and save it in a safe place. This sentence will be needed to restore the wallet on a different computer.

To unlock your wallet:
* docker-compose exec node unlock

To get all addresses of your wallet:
* docker-compose exec node addresses

To get the status of your wallet:
* docker-compose exec node status

To view the UI:
* Open a browser and go to http://localhost:9053/panel
