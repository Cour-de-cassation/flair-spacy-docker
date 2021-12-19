FROM python:3.8-slim as flair
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG VERSION

RUN apt-get update -y && apt-get dist-upgrade -y

RUN pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` --upgrade pip;\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` flair==${VERSION};

