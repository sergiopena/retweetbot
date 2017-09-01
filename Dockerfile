FROM ruby:2.3-alpine

RUN mkdir -p '/usr/src/app'
WORKDIR '/usr/src/app'

COPY Gemfile /usr/src/app

RUN apk add --update alpine-sdk

RUN bundle install

COPY run /usr/src/app

RUN apk add --update bash

ADD cronjob /var/spool/cron/crontabs/root
#RUN chmod 0644 /etc/cron.d/tweetbot
RUN touch /var/log/cron.log

CMD crond -f -l2 && tail -f /var/log/cron.log

#Expects accounts.json file on /data mounted to the volume
# docker run -v dir:/data dockerimage
