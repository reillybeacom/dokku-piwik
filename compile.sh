#!/bin/sh

# Copy config
cp config.ini.php vendor/piwik/piwik/config/config.ini.php

# Update db config
DB_HOST=`echo $DATABASE_URL | cut -d@ -f2 | cut -d: -f1`
DB_USERNAME=`echo $DATABASE_URL | cut -d@ -f1 | cut -d/ -f3 | cut -d: -f1`
DB_PASSWORD=`echo $DATABASE_URL | cut -d@ -f1 | cut -d/ -f3 | cut -d: -f2`
DB_NAME=`echo $DATABASE_URL | cut -d@ -f2 | cut -d: -f2 | cut -d/ -f2`
DB_PORT=`echo $DATABASE_URL | cut -d@ -f2 | cut -d: -f2 | cut -d/ -f1`

sed -i s/#DB_HOST/$DB_HOST/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_USERNAME/$DB_USERNAME/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_PASSWORD/$DB_PASSWORD/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_NAME/$DB_NAME/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_PORT/$DB_PORT/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#SECRET_TOKEN/$SECRET_TOKEN/ vendor/piwik/piwik/config/config.ini.php

# Download maxmind db
curl http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz > vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
gunzip vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
mv vendor/piwik/piwik/misc/GeoLiteCity.dat vendor/piwik/piwik/misc/GeoIPCity.dat
