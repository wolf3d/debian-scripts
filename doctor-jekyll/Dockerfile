# Pull base image
FROM debian:jessie

# Update packages
RUN apt-get update && apt-get install -y \
    python2.7 \
    build-essential \
    ruby-full \
    ruby-dev && \
    ruby -S gem install jekyll kramdown jekyll-paginate jekyll-gist && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

WORKDIR /var/jekyll

EXPOSE	4000
