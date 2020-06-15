## FROM : ベースとなるイメージを指定（ 「:」以降は「タグ」と呼ばれる ）
```dockerfile
FROM ubuntu:16.04
```


## 誰が書いたかを表す
```dockerfile
MAINTAINER kakisoft <sample@gmail.com>
```


## RUN: Dockerイメージビルド時に、Dockerコンテナ内で実行するコマンド
ビルド時に１回だけ実行されるコマンド、という意味？
```dockerfile
RUN echo "now building..."
RUN mkdir /echo
RUN apk add --no-cache --virtual=build-deps build-base && \
    apk add --no-cache g++ && \
    pip3 install locustio pyzmq && \
    apk del --no-cache build-deps
```


## CMD: Dockerコンテナとして実行する際に、コンテナ内で実行するプロセスを指定する。
イメージをビルドするための RUN に対し、CMD はコンテナ起動時に実行される。  
（ビルドしようがしまいが、必ず実行する命令、という意味？）  

イメージを実行する時、コンテナに対して何もオプションを指定しなければ、自動的に実行するコマンドを CMD 命令で指定する。
```dockerfile
CMD ["echo", "now running..."]
CMD ["/bin/bash"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```


## COPY : Dockerを動作させているホストマシン上のファイルやディレクトリを、Dockerコンテナ内にコピーする
```dockerfile
COPY helloworld /usr/local/bin
```


## ADD: ローカルのファイルをコンテナにコピー
```dockerfile
ADD ./index.html /var/www/html/
```

## ADD と COPY
http://docs.docker.jp/engine/userguide/eng-image/dockerfile_best-practices.html?highlight=add#add-copy  
>ADD と COPY の機能は似ていますが、一般的には COPY が選ばれます。  
>それは ADD よりも機能がはっきりしているからです。  


## EXPOSE: 起動時に指定ポートをLISTEN 
```dockerfile
EXPOSE 80
```


## SHELL
http://docs.docker.jp/engine/reference/builder.html#shell  

デフォルトのシェルを、上書き設定するために利用します。   
デフォルトのシェルは Linux 上では ["/bin/sh", "-c"]、Windows 上では ["cmd", "/S", "/C"] です。  

```dockerfile
SHELL ["cmd", "/S", "/C"]
SHELL ["/bin/bash", "-l", "-c"]
```

