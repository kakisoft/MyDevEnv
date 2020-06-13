# FROM : ベースとなるイメージを指定（ 「:」以降は「タグ」と呼ばれる ）
```dockerfile
FROM ubuntu:16.04
```


# 誰が書いたかを表す
```dockerfile
MAINTAINER kakisoft <sample@gmail.com>
```


# RUN: Dockerイメージビルト時に、Dockerコンテナ内で実行するコマンド
```dockerfile
RUN echo "now building..."
RUN mkdir /echo
RUN apk add --no-cache --virtual=build-deps build-base && \
    apk add --no-cache g++ && \
    pip3 install locustio pyzmq && \
    apk del --no-cache build-deps
```


# CMD: Dockerコンテナとして実行する際に、コンテナ内で実行するプロセスを指定する。
イメージをビルドするための RUN に対し、CMD はコンテナ起動時に実行される。
```dockerfile
CMD ["echo", "now running..."]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```


# COPY : Dockerを動作させているホストマシン上のファイルやディレクトリを、Dockerコンテナ内にコピーする
```dockerfile
COPY helloworld /usr/local/bin
```


# ADD: ローカルのファイルをコンテナにコピー
```dockerfile
ADD ./index.html /var/www/html/
```

# ADD と COPY
http://docs.docker.jp/engine/userguide/eng-image/dockerfile_best-practices.html?highlight=add#add-copy  
>ADD と COPY の機能は似ていますが、一般的には COPY が選ばれます。  
>それは ADD よりも機能がはっきりしているからです。  


# EXPOSE: 起動時に指定ポートをLISTEN 
```dockerfile
EXPOSE 80
```



