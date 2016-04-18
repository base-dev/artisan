# Artisan

*Note*: This image installs dependencies for artisan, but not artisan itself.

This is a generic container for running `artisan` commands. It mostly just adds different database and key-value-store dependencies that may be needed in a typical project.

The layers of this image:
- debian:jessie
- basedev/cli
- basedev/phpcli
- basedev/artisan

Included packages:

- php7.0-mcrypt
- php7.0-mongodb
- php7.0-mysql
- php7.0-pgsql
- php7.0-redis
- php7.0-sqlite3
- php7.0-gd

## Usage

Artisan runs in the `/data` directory, so just mount your project folder there.

```sh
$ docker run -v "${PWD}":/data basedev/artisan help

# Explanation:
docker run                    # Run a docker container
-v "${PWD}":/data             # Use PWD as root directory for tools
basedev/artisan               # The docker image (subject to change)
help                          # The command to run
```

Notice that we didn't specify the `-i`(interactive) or the
`-t`(pseudo-terminal) flags in the examples. This is because we almost never
need it, but for commands like `artisan tinker` that wants to do interactive
querying, you would need to pass those flags.

If you want *color output* from `artisan`, like you normally get when you run `artisan help`, you will need to pass the `-t`-flag.

## Building the image

You can build this image as any other docker image:

```
docker build .
```

Or optionally with a tag, like we do when we want to push it to i.e. docker hub:

```
docker build -t myrepo/artisan .
```
