FROM python:3.8-slim as flair-spacy
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG FLAIR_VERSION
ARG SPACY_VERSION

RUN apt-get update -y && apt-get dist-upgrade -y

RUN apt-get install curl build-essential -y;\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` --upgrade pip;\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` flair==${FLAIR_VERSION} spacy==${SPACY_VERSION};\
    apt-get autoremove build-essential -y;\
    apt-get purge perl manpages libfakeroot:amd64 gpg-agent dpkg-dev dirmngr -y;\
    apt-get autoclean -y
