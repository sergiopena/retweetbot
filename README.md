# Retweetbot

Quickly got tired of Marketing people asking me if I retweeted their stuff, so I made this.
Basically, it reads tweeter tokens from a JSON and check for the latest tweet from a given account and retweets it.

#Usage

It's dockerized so clone the repo and:

```
docker build -t retweetbot-0.0.0 .
docker run -d -v $(pwd):/data retweetbot-0.0.0
```

Volume is there because it expects the JSON file on /data path and I wanted to manage credentials without stopping the container.

It relies on busybox cron and by default it checks for latest tweets once an hour. If you want to change this modify the cronjob file and rebuild the image.
