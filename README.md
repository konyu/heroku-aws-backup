# heroku-aws-backup

A Heroku and AWS backup docker container

It's on [docker-hub](https://hub.docker.com/r/konyu/xxxxxx/) and [github](https://github.com/konyu/heroku-aws-backup/)

## Prepare AWS and Heroku auth key
You should set environment variables for AWS access key and secret key and heroku api-key.

### AWS access key and secret key
http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html

### Heroku api token
https://devcenter.heroku.com/articles/authentication#api-token-storage

## How to build

```sh
git clone git@github.com:konyu/heroku-aws-backup.git
cd heroku-aws-backup
docker build --rm -t konyu/heroku-aws-backup .
```

## launch in a local environment
You can launch a container with AWS and Heroku environment variables.

```
docker run -it --rm --env AWS_ACCESS_KEY_ID=xxxxxxx \
--env AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxx \
--env AWS_DEFAULT_REGION=ap-northeast-1 \
--env HEROKU_API_KEY=xxxxxxxxxxxxx \
heroku-aws-backup bash
```


# How to move with Heroku

## Install heroku cli
Refer to the following page.
https://devcenter.heroku.com/articles/heroku-command-line

## Add heroku container registry

```
heroku plugins:install heroku-container-registry
```

## Deploy to Heroku

Move to this repository directory

### login heroku

```
heroku login
> enter your id and password
```

### create application

```
heroku create APP_NAME_YOU_WANT
```

## deploy application

```
heroku container:push web
```

## Set environment variables

```
heroku config:set AWS_ACCESS_KEY_ID=xxxxxxx AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxx AWS_DEFAULT_REGION=ap-northeast-1 HEROKU_API_KEY=xxxxx -app APP_NAME_YOU_WANT
```

# Add Scheduler Add-on(like crond)

```
heroku addons:create scheduler:standard -app APP_NAME_YOU_WANT
```

# Add schedule at heroku
![2016-11-18 11 39 35](https://cloud.githubusercontent.com/assets/1217706/20417217/33c8071c-ad87-11e6-9da7-0b755a21ea1b.png)
