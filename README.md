# dokku-piwik

This is a simple setup of Piwik and a few plugins, suitable for running on [dokku](http://dokku.viewdocs.io/dokku/).

Piwik Version: *2.16.1*

Additional plugins:
- [Custom Dimensions 0.1.4](https://plugins.piwik.org/CustomDimensions)
- [Platforms Report 1.0.4](https://plugins.piwik.org/PlatformsReport)

Note that some plugins are disabled by default.

## Deploy

1. Create a Heroku app and add MySQL database to it
1. Connect directly to your MySQL database and upload the existing schema `piwik.schema.sql` (the PIWIK wizard will not be able to do this for you on Heroku)
1. Set the Heroku config vars as below
1. Push code to heroku
1. You can log-in for the first time with `user`, `bitnami`. Change this password!

## Config

The config files have been customised to my needs, make sure you edit it before launching the app and customise it to your own needs. Note that some settings made from the Piwik web UI (e.g. changing plugins) won't persist between launches unless you add those changes to this repository as well.

These env vars are available:

- **DB_HOST:** your database's host
- **DB_USERNAME:** your database's username
- **DB_PASSWORD:** your database's password
- **DB_NAME:** your database's name
- **SECRET_TOKEN:** secret secret
- **LOGO_URL:** A URL to a logo to replace the PIWIK header logo.

## Archiving

The Procfile includes a process responsible for running the `core:archive` task. It's set to run every 3600 seconds by default, but this interval can be changed using the env var ARCHIVE_INTERVAL.

## Plugins

You can use composer to install additional plugins. See https://github.com/composer/installers and the examples in `composer.json`.

## Notes

https://github.com/perusio/piwik-nginx/blob/master/apps/piwik/piwik.conf

## License

MIT
