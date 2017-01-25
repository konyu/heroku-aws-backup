FROM ruby:2.3.1

RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list && \
    wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -

RUN apt-get update && \
    apt-get install -y python-dev python-pip heroku-toolbelt && \
    pip install awscli

# ADD Shell files
RUN mkdir -p /opt/sh
ADD ./sh /opt/sh
WORKDIR /opt/sh

CMD heroku
