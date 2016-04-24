#!/bin/sh

# Copy config
cp config/config.ini.php vendor/piwik/piwik/config/config.ini.php

# Update config
DB_HOST=`echo $DATABASE_URL | cut -d@ -f2 | cut -d: -f1`
DB_USERNAME=`echo $DATABASE_URL | cut -d@ -f1 | cut -d/ -f3 | cut -d: -f1`
DB_PASSWORD=`echo $DATABASE_URL | cut -d@ -f1 | cut -d/ -f3 | cut -d: -f2`
DB_NAME=`echo $DATABASE_URL | cut -d@ -f2 | cut -d: -f2 | cut -d/ -f2`

sed -i s/#DB_HOST/$DB_HOST/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_USERNAME/$DB_USERNAME/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_PASSWORD/$DB_PASSWORD/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_NAME/$DB_NAME/ vendor/piwik/piwik/config/config.ini.php

sed -i s/#SECRET_TOKEN/$SECRET_TOKEN/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#POSTMARK_TOKEN/$POSTMARK_TOKEN/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#NOREPLY_EMAIL/$NOREPLY_EMAIL/ vendor/piwik/piwik/config/config.ini.php

# Download maxmind db
curl -sS http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz > vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
gunzip vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
mv vendor/piwik/piwik/misc/GeoLiteCity.dat vendor/piwik/piwik/misc/GeoIPCity.dat

# Install plugins
cp -r vendor/piwik-customdimensions vendor/piwik/piwik/plugins/CustomDimensions
cp -r vendor/piwik-platformsreport vendor/piwik/piwik/plugins/PlatformsReport
