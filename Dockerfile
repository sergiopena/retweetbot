FROM ruby:2.3-alpine

RUN mkdir -p '/usr/src/app'
WORKDIR '/usr/src/app'

COPY Gemfile /usr/src/app

RUN apk add --update alpine-sdk
RUN bundle install

COPY run /usr/src/app
ADD cronjob /var/spool/cron/crontabs/root

CMD crond -f -l2
