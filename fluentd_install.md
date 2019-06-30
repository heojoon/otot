# fluentd Install

Ref. https://docs.fluentd.org/installation/install-by-rpm


## 1. before Install
https://docs.fluentd.org/installation/before-install

## 2. install
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh

## 3. start
systemctl start td-agent.service

## 4. test
tail -f /var/log/td-agent/td-agent.log

curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test
