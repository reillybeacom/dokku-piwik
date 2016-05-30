#!/bin/sh

# Copy config
cp config/config.ini.php vendor/piwik/piwik/config/config.ini.php

sed -i s/#DB_HOST/$DB_HOST/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_USERNAME/$DB_USERNAME/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_PASSWORD/$DB_PASSWORD/ vendor/piwik/piwik/config/config.ini.php
sed -i s/#DB_NAME/$DB_NAME/ vendor/piwik/piwik/config/config.ini.php

sed -i s/#SECRET_TOKEN/$SECRET_TOKEN/ vendor/piwik/piwik/config/config.ini.php

# Download maxmind db
curl -sS http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz > vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
gunzip vendor/piwik/piwik/misc/GeoLiteCity.dat.gz
mv vendor/piwik/piwik/misc/GeoLiteCity.dat vendor/piwik/piwik/misc/GeoIPCity.dat

# Download logo
mkdir -p vendor/piwik/piwik/misc/user
curl -sS "$LOGO_URL" > vendor/piwik/piwik/misc/user/logo-header.png
curl -sS "$LOGO_URL" > vendor/piwik/piwik/misc/user/logo.png

# Install plugins
cp -r vendor/piwik-custom-dimensions vendor/piwik/piwik/plugins/CustomDimensions
cp -r vendor/piwik-platforms-report vendor/piwik/piwik/plugins/PlatformsReport
