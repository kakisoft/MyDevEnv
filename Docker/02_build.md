### イメージ作成
```
sudo docker commit <CONTAINER ID> <イメージ名>
```
イメージ名は、「ユーザ名/名称」とするのが慣習だそうな。  
ユーザ名は、Docker Hubのアカウント名と同一にしておく。

## ビルド
イメージからコンテナを立ち上げ、何らかの変更を加えたものをイメージ化する作業を、スクリプトに記述して自動化できる。  
自動化する内容は、『Dockerfile』というファイルを作成して記述する。  
（以下、Dockerfile 記述例）
```
# 何のイメージかを表す
FROM centos

# 誰が書いたかを表す
MAINTAINER kakisoft <sample@gmail.com>

# RUN: buildする時に実行される
RUN echo "now building..."
RUN yum install -y httpd

# ADD: ローカルのファイルをコンテナにコピー
ADD ./index.html /var/www/html/

# EXPOSE: 起動時に指定ポートをLISTEN 
EXPOSE 80

# CMD: runする時に実行される
CMD ["echo", "now running..."]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

```
Dockerfile作成後、以下を実行
```
sudo docker build -t <イメージ名> .
```

### Docker Hubへのログイン
```
sudo docker login
```

### Docker Hubへプッシュ(アップロード)
ログイン後に実行する。
```
sudo docker push <DockerHubID/イメージ名>
```
入力例：```sudo docker push kakisoft/httpd```  
イメージ名の先頭は、DockerHubIDでなければいけないのだろうか。  
この辺はまだ良くわからないです。

プッシュしたイメージを取得する場合、
```sudo docker pull <イメージ名>```
でOK。
  