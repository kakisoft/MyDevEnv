## FROM : ベースとなるイメージを指定（ 「:」以降は「タグ」と呼ばれる ）
```dockerfile
FROM ubuntu:16.04
```


## MAINTAINER : 誰が書いたかを表す（廃止予定）
http://docs.docker.jp/engine/reference/builder.html#maintainer
```dockerfile
MAINTAINER kakisoft <sample@gmail.com>
```


## RUN: Dockerイメージビルド時に、Dockerコンテナ内で実行するコマンド
http://docs.docker.jp/engine/reference/builder.html#run  

ビルド時に１回だけ実行されるコマンド、という意味？  
２つの形式がある。  
```dockerfile
RUN echo "now building..."
RUN mkdir /echo
RUN apk add --no-cache --virtual=build-deps build-base && \
    apk add --no-cache g++ && \
    pip3 install locustio pyzmq && \
    apk del --no-cache build-deps


RUN ["/bin/bash", "-c", "echo hello"]
```


## CMD: Dockerコンテナとして実行する際に、コンテナ内で実行するプロセスを指定する。
http://docs.docker.jp/engine/userguide/eng-image/dockerfile_best-practices.html?highlight=add#cmd  

イメージをビルドするための RUN に対し、CMD はコンテナ起動時に実行される。  
（ビルドしようがしまいが、必ず実行する命令、という意味？）  

イメージを実行する時、コンテナに対して何もオプションを指定しなければ、自動的に実行するコマンドを CMD 命令で指定する。
```dockerfile
CMD ["echo", "now running..."]
CMD ["/bin/bash"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```

> CMD コマンドは、イメージ内に含まれるソフトウェアを実行するために用いるもので、引数を指定して実行します。  
> CMD はほぼ、CMD ["実行モジュール名", "引数1", "引数2" …] の形式をとります。  
> Apache や Rails のようにサービスをともなうイメージに対しては、たとえば CMD ["apache2","-DFOREGROUND"] といったコマンド実行になります。  
> 実際にサービスベースのイメージに対しては、この実行形式が推奨されます。  


## COPY : Dockerを動作させているホストマシン上のファイルやディレクトリを、Dockerコンテナ内にコピーする
```dockerfile
COPY helloworld /usr/local/bin
```


## ADD: ローカルのファイルをコンテナにコピー
```dockerfile
ADD ./index.html /var/www/html/
```

#### ADD と COPY
http://docs.docker.jp/engine/userguide/eng-image/dockerfile_best-practices.html?highlight=add#add-copy  
>ADD と COPY の機能は似ていますが、一般的には COPY が選ばれます。  
>それは ADD よりも機能がはっきりしているからです。  


## EXPOSE: 起動時に指定ポートをLISTEN
http://docs.docker.jp/engine/userguide/eng-image/dockerfile_best-practices.html?highlight=add#expose  

コンテナが接続のためにリッスンするポートを指定します。  
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


## ENV
http://docs.docker.jp/engine/reference/builder.html#env  

環境変数 \<key\> に \<value\> という値を設定する。  
２種類の書式がある。
```dockerfile
ENV GOLANG_VERSION 1.13.12

ENV myName="John Doe" myDog=Rex\ The\ Dog \
    myCat=fluffy
```


## WORKDIR
http://docs.docker.jp/engine/reference/builder.html#workdir  

ワークディレクトリを設定する。存在しない場合は生成される。  
（コンテナログインした時のデフォルトパス。キャッシュを使用せずにリビルドしないと、変更内容が反映されない）
```dockerfile
WORKDIR /path/to/workdir
```


## USER
http://docs.docker.jp/engine/reference/builder.html#user

```dockerfile
USER <user>[:<group>]

USER <UID>[:<GID>]
```

USER 命令は、ユーザ名（または UID）と、オプションとしてユーザグループ（または GID）を指定します。   
そしてイメージが実行されるとき、Dockerfile 内の後続の RUN、CMD、ENTRYPOINT の各命令においてこの情報を利用します。  



