FROM ruby:2.3.1

## For software-properties-common and apt-get with https
RUN apt-get update && \
    apt-get install -y apt-transport-https

# Preparing heroku cli
RUN apt-get install -y software-properties-common && \
    add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
RUN curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add -

# Install libs
RUN apt-get update
RUN apt-get install -y python-dev python-pip heroku && \
    pip install awscli


# ADD Shell files
RUN mkdir -p /opt/sh
ADD ./sh /opt/sh
WORKDIR /opt/sh

CMD heroku
