#!/bin/bash

# Update explorer config file
sed -i "s/http:\/\/213.239.193.208:9053/http:\/\/node:9053/g" modules/chain-grabber/src/main/resources/application.conf
sed -i "s/jdbc:postgresql:\/\/localhost:5432\/explorer/jdbc:postgresql:\/\/postgres:5432\/explorer/g" modules/chain-grabber/src/main/resources/application.conf
sed -i "s/db.user = \"postgres\"/db.user = \"$POSTGRES_USER\"/g" modules/chain-grabber/src/main/resources/application.conf
sed -i "s/db.pass = \"1234\"/db.pass = \"$POSTGRES_PASSWORD\"/g" modules/chain-grabber/src/main/resources/application.conf
sed -i "s/redis:\/\/localhost:6380/redis:\/\/redis:6379/g" modules/chain-grabber/src/main/resources/application.conf

export PGPASSWORD="$POSTGRES_PASSWORD"

if [ "$( psql -h postgres -U "$POSTGRES_USER" -XtAc "SELECT 1 FROM information_schema.tables WHERE table_schema='public'" -d explorer )" != '1' ]
then
	sed -i "s/READONLY_USER/$READONLY_USER/g" ../readonly.sql
	sed -i "s/READONLY_PASSWORD/$READONLY_PASSWORD/g" ../readonly.sql
	psql -h postgres -U "$POSTGRES_USER" -d explorer -f ../readonly.sql
	cat modules/explorer-core/src/main/resources/db/V9__Schema.sql | psql -h postgres -U "$POSTGRES_USER" explorer
fi

# Run chain grabber
sbt chain-grabber/run
