#!/bin/bash

echo "== STOP : EFK =="
docker stop fluentd kibana elasticsearch

docker rm fluentd kibana elasticsearch
