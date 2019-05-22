# Centeral Server 

1. Docker 설치 환경 준비
외부망이 차단되어 있는 상태에서는 로컬 레파지토리 생성을 해야한다.

## docker repository download
~~~
wget 도커
~~~

## docker stable 버전만 압축
~~~
tar 경로
~~~

## 보안 인증 단계를 거쳐서 sftp를 통해 서버에 docker 패키지 압축파일 업로드

2. Local 레파지토리 생성

~~~

~~~

3. elasticsearch 다운로드.
현재 최신버전이 7.0.1 , 6.7.2 이며 여기서는 6.7.2로 진행한다.

https://hub.docker.com/_/elasticsearch
https://www.elastic.co/guide/en/elasticsearch/reference/6.7/docker.html

~~~
docker pull elasticsearch:6.7.2
~~~

4. kibana 다운로드
현재 최신버전이 7.0.1 , 6.7.2 이며 여기서는 6.7.2로 진행한다.

https://hub.docker.com/_/kibana
https://www.elastic.co/guide/en/kibana/6.7/docker.html

~~~
docker pull kibana:6.7.2
~~~

5. Fluentd 다운로드
latest 버전을 받을 수 있지만 버전 관리를 위하여 다운로드 버전을 명시하여 받는다.

https://hub.docker.com/_/fluentd

~~~
docker pull fluentd:v1.4.2-2.0
~~~


