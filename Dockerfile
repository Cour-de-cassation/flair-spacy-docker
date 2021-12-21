FROM python:3.8-slim as flair-spacy
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG FLAIR_VERSION
ARG SPACY_VERSION

RUN apt-get update -y && apt-get dist-upgrade -y

RUN pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` --upgrade pip &&\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` torch==1.10.1+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html &&\
    pip install `echo $http_proxy | sed 's/\(\S\S*\)/--proxy \1/'` flair==${FLAIR_VERSION} spacy==${SPACY_VERSION} &&\
