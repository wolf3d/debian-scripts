# Pull base image
FROM debian:jessie

# Update packages
RUN apt-get update && apt-get install -y \
    python2.7 \
    build-essential \
    ruby-full \
    ruby-dev && \
    ruby -S gem install jekyll kramdown jekyll-paginate jekyll-gist

WORKDIR /src

EXPOSE	4000
