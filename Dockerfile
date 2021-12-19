FROM python:3.8-slim as flair
ARG http_proxy
ARG https_proxy
ARG no_proxy

RUN apt-get update -y

RUN apt-get install curl build-essential -y;\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` --upgrade pip;\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` flair;\
    apt-get autoremove build-essential -y;\
    apt-get purge perl manpages libfakeroot:amd64 gpg-agent dpkg-dev dirmngr -y;\
    apt-get autoclean -y

