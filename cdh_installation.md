# 클라우데라 인스톨 가이드

- 설치 버전 : CDH 5.8 
- 설치 방법 : docker 

## 클라우데라 docker 버전 설치 개요

## docker 를 사용해서 필수 요소들만 설치
[출처] https://hub.docker.com/r/cloudera/clusterdock
 - 주요사항
  1. 최소 2개 노드로 설치 가능 ( Requirements : Memory 16GB ) ,  4개 노드 설치 시 ( Requirements : Memory 24GB )
  2. single Host - multi node 개념으로 설치 
  3. 노드를 확장할 수 있는 있음
  4. 엔진도 필요한 부분은 Include 해서 설치할 수 있음
  5. 최소 매니저 설치 컴포넌트 
  ~~~
   HDFS, Apache ZooKeeper, Apache HBase, and YARN present
  ~~~
 
 - 클라우데라 매니저 설치 컴포넌트 
 [출처] https://www.cloudera.com/documentation/enterprise/latest/topics/admin_config_services.html
 개별 CDH 및 기타 고유 한 요구 사항 또는 옵션이 있는 기타 서비스의 구성 및 관리 
~~~
 HBase
 HDFS
 Hive
 Hue
 Impala
 Key-Value Store Indexer
 Kudu
 Solr
 Spark
 Sqoop 1 Client
 Sqoop 2
 YARN (MRv2) and MapReduce (MRv1)
 Managing ZooKeeper
~~~

클러스터독 gitbut
https://github.com/cloudera/clusterdock


- HUE WebUI infomation
~~~
http://{아이피}:32768
~~~

- Cloudera Manager
~~~
http://{아이피}:32769
(초기 로그인 정보 : admin/admin)
~~~

- official docker container install manual  (참고)
~~~
https://www.cloudera.com/documentation/enterprise/5-6-x/topics/quickstart_docker_container.html
~~~

## Quick Start Installation

### Requirements 
 1. aws ec2 t2.xlarge 1대
 2. centos 7.6
 3. docker-ce 1.18
 
### Install Step by Step
 1. AWS EC2 생성
  - OS : centos7 (HVM)
  - spec : 최소 t2.xlarge 
 2. ssh 접속
~~~
ssh -i {SSHKEY}.pem centos@{AWS-EC2-IP}
~~~
** Windows 환경에서 접속시 SSH KEY 퍼미션 에러 문제 해결 **
~~~
<img src="https://raw.githubusercontent.com/heojoon/otot19/master/ssh_key_permission_for_windows.png">
~~~
 3. docker-ce 설치
~~~
wget https://raw.githubusercontent.com/heojoon/oss/master/install_dockerCE_for_centos.sh
~~~
 3. 클라우데라 docker pull
~~~
 docker pull cloudera/clusterdock
~~~
 4. 클라우데라 설치 스크립트 다운로드 및 패스 설정
~~~
wget http://tiny.cloudera.com/clusterdock.sh
source clusterdock.sh
~~~
 5. 클라우데라 기본설치
~~~
clusterdock_run ./bin/start_cluster cdh
~~~
 
 
 


