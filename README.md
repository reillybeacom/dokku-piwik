# dokku-piwik

This is a simple setup of Piwik and a few plugins, suitable for running on [dokku](http://dokku.viewdocs.io/dokku/).

Piwik Version: *2.16.1*

Additional plugins:
- [Custom Dimensions 0.1.4](https://plugins.piwik.org/CustomDimensions)
- [Platforms Report 1.0.4](https://plugins.piwik.org/PlatformsReport)

Note that some plugins are disabled by default.

## Deploy

Install mariadb and create the app and its db:

```
dokku plugin:install https://github.com/dokku/dokku-mariadb.git mariadb
dokku mariadb:create piwik
dokku apps:create piwik
```

Now push piwik, then link the two:

```
# localhost:
git clone git@github.com:Aluxian/dokku-piwik.git
cd dokku-piwik
vim config.ini.php # edit settings
git remote add dokku dokku@yourserver.me:piwik
git push dokku master

# on dokku:
dokku mariadb:link piwik piwik # not sure if this can be done earlier; restart the app if needed
```

## Config

The config files have been customised to my needs, make sure you edit it before launching the app and customise it to your own needs. Note that some settings made from the Piwik web UI (e.g. changing plugins) won't persist between launches unless you add those changes to this repository as well.

These env vars are available:

- DB_HOST
- DB_USERNAME
- DB_PASSWORD
- DB_NAME
- NOREPLY_EMAIL
- SECRET_TOKEN
- POSTMARK_TOKEN
- POSTMARK_TOKEN

If your setup doesn't work, it's probably because of `force_ssl = 1` in config.

## How about plugins?

You can use composer to install additional plugins. See https://github.com/composer/installers and the examples in `composer.json`.

## License

MIT
