# 클라우데라 인스톨


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
