#!/bin/bash

#
# EFK startup script v0.2
#

DIR=/app/efk/conf

# Initial basic emvironment set ( first time run )
sysctl -w vm.max_map_count=2621440

# Create docker bridge network ( first time run )
docker network create -d bridge --subnet 192.168.10.0/24 --gateway 192.168.10.1 otot 2>/dev/null

fn_es_startup() {
## Launch elasticsearch
docker run -d \
--network otot \
--name elasticsearch \
--expose 19200 \
--expose 19300 \
-p 19200:19200 \
-p 19300:19300 \
-v ${DIR}/elasticsearch/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v ${DIR}/elasticsearch/jvm.options:/usr/share/elasticsearch/config/jvm.options \
-v /data/elasticsearch/data:/usr/share/elasticsearch/data \
-v /data/elasticsearch/logs:/usr/share/elasticsearch/logs \
elasticsearch:6.7.2
}
#-v ${DIR}/elasticsearch/log4j2.properties:/usr/share/elasticsearch/config/log4j2.properties \

#--env ES_JAVA_OPTS="-Xms16g -Xmx16g" \


fn_kibana_startup() {
## Launch kibana
docker run -d \
--network otot \
--name kibana \
--link elasticsearch \
-p 15601:5601 \
-v ${DIR}/kibana/config/kibana.yml:/usr/share/kibana/config/kibana.yml \
-v ${DIR}/kibana/kibana-plugins:/usr/share/kibana/plugins \
kibana:6.7.2
}

fn_fluentd_startup() {
## Launch fluentd
docker run -d \
--network otot \
--name fluentd \
-v /home/cjarch/MSSQL:/tmp/test \
fluentd:v1.4.2-2.0
}

echo "== STARTUP : EFK =="

echo "== START : Kibana =="
if [ "$(docker inspect kibana --format='{{.State.Status}}' 2>/dev/null)" != "exited" ];then
        fn_fluentd_startup
else
        docker start fluentd
fi

echo "== START : ElasticSearch  =="
if [ "$(docker inspect elasticsearch --format='{{.State.Status}}' 2>/dev/null)" != "exited" ];then
        fn_es_startup
else
        docker start elasticsearch
fi

echo "== START : Kibana =="
if [ "$(docker inspect kibana --format='{{.State.Status}}' 2>/dev/null)" != "exited" ];then
        fn_kibana_startup
else
        docker start kibana
fi
