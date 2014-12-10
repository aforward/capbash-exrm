capbash-exrm
==============

Scripts for installing an [elixir](http://elixir-lang.org/) based application using [exrm](https://github.com/bitwalker/exrm).  Elixir is a functional, meta-programming aware language built on top of the Erlang VM., should be used in conjunction with capbash

# How to Install #

Install capbash first, more details at:
https://github.com/aforward/capbash

```
curl -s https://raw.githubusercontent.com/aforward/capbash/master/capbash-installer | bash
capbash new YOUR_REPO_ROOT
cd YOUR_REPO_ROOT
```

Now you can install exrm into your project

```
capbash install exrm
```

# Configurations #

The available configurations include:

```
ELIXIR_VERSION=${ELIXIR_VERSION-v1.0.0}
ELIXIR_MODE=${ELIXIR_MODE-docker}
ELIXIR_LAUNCHER_DIR=${ELIXIR_LAUNCHER_DIR-/var/local/elixir/$ELIXIR_VERSION}

EXRM_LOG_DIR=${EXRM_LOG_DIR-/var/log}
EXRM_PROXY_PORT=${EXRM_PROXY_PORT-80}
EXRM_NAME=${EXRM_NAME-sampleexrm}
EXRM_VERSION=${EXRM_VERSION-0.0.1}
EXRM_LAUNCHER_DIR=${EXRM_LAUNCHER_DIR-/var/local/apps/${EXRM_NAME}}
EXRM_REPO=${EXRM_REPO-https://github.com/aforward/sampleexrm.git}
EXRM_HTTP_PORT=${EXRM_HTTP_PORT-80}
EXRM_SSL_PORT=${EXRM_SSL_PORT-443}
EXRM_MODE=${EXRM_MODE:as_is} # supports as_is, nginx
EXRM_APP_PORT=${EXRM_INTERNAL_PORT-$EXRM_HTTP_PORT}
EXRM_SERVER_NAMES=${EXRM_SERVER_NAMES-_}
```

# Deploy to Remote Server #

To push the exrm script to your server, all you need if the IP or hostname of your server (e.g. 192.167.0.48) and your root password.

```
capbash deploy <IP> exrm
```

For example,

```
capbash deploy 127.0.0.1 exrm
```
