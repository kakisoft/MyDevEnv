dockerコンテナの構築を Dockerfileで行い、docker-composeでオーケストレーション

## 起動・終了
```
docker-compose up -d
docker-compose down

※バックグラウンドで起動
```
Ctrl-C で終了した場合、```tmp/pids/server.pid``` を削除し、再起動。  


## 再起動
```
# フォアグラウンドで起動していた場合
docker-compose up

# バックグラウンドで起動していた場合
docker-compose restart
```


## ビルドして起動
```
docker-compose up -d --build
```


## コンテナに入る
```
docker-compose exec app bash


# 移動は Dockerfile の WORKDIR を編集した方がいいけど、このやり方で出来なくもない
docker-compose exec app bash -c "cd my-laravel-app/"
```

## ユーザを指定してコンテナログイン
```
docker-compose exec --user root app bash
```


## 終了時にコンテナを削除
```
docker-compose down --rmi all
docker-compose down --rmi all --volumes
```
※ データベース名（MYSQL_DATABASE）を変更した場合、「--volumes」で丸ごと削除してから、また作り直した方がよさそう。

##### docker-compose down : Options
https://docs.docker.com/compose/reference/down/
```
--rmi type  Remove images. Type must be one of:
            'all': Remove all images used by any service.
            'local': Remove only images that don't have a
```


## コンテナログイン
https://docs.docker.com/compose/reference/exec/
```
exec [options] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]

（例）
docker-compose exec app bash
```



## キャッシュを使用せずにビルド
キャッシュを使用せずにリビルドしないと、Dockerfile の変更内容が反映されない（一部だけ？）
```
docker-compose build --no-cache
```


## サイズ確認
```
docker system df
```

_____________________________________________________________________________________
_____________________________________________________________________________________
_____________________________________________________________________________________
## コンテナの外から composer install
```
docker-compose run --rm app composer install --ignore-platform-reqs
```
https://docs.docker.com/compose/reference/run/  

--rm : Remove container after run. Ignored in detached mode.  


_____________________________________________________________________________________
_____________________________________________________________________________________
_____________________________________________________________________________________
## ヘルプ
```
docker-compose help
```

_____________________________________________________________________________________
_____________________________________________________________________________________
_____________________________________________________________________________________
#### down  
https://docs.docker.com/compose/reference/down/  
起動中のコンテナを停止・削除する。なお、デフォルトの挙動で削除されるのはdocker-compose.ymlに定義されたcontainer・networkとなる。  
externalで定義したnetwork・volumeは削除対象にはならない。  


#### stop
https://docs.docker.com/compose/reference/stop/  
起動中のコンテナを削除せずに停止する。削除していないので、docker-compose startで再起動する。  

_____________________________________________________________________________________
_____________________________________________________________________________________
_____________________________________________________________________________________
## Docs > Docker Compose > コマンドライン・リファレンス > up
<https://docs.docker.com/compose/reference/up/>  
<http://docs.docker.jp/compose/reference/up.html>  
```
オプション:
    -d     デタッチド・モード: バックグラウンドでコンテナを実行し、新しいコンテナ名を表示
```


_____________________________________________________________________________________
_____________________________________________________________________________________
_____________________________________________________________________________________
## docker-compose `up` とか `build` とか `start` とかの違いを理解できていなかったのでまとめてみた。
https://qiita.com/tegnike/items/bcdcee0320e11a928d46


|         |  image構築  |  コンテナ構築  |  コンテナ起動  |
|:--------|:----------|:---------|:---------|
|  build  |  ○        |  ×       |  ×       |
|  up     |  △        |  ○       |  ○       |
|  start  |  ×        |  ×       |  ○       |
|  run    |  ○ （単独）   |  ○ （単独）  |  ○ （単独）  |



### build
imageを構築する。コンテナは作成しない。  

キャッシュがあればそちらを優先的に使ってビルドするので、Dockerfileを更新したなどの理由でキャッシュを使いたくない場合は 
```
docker-compose build --no-cach
```
とする。

##### キャッシュ
Dockerは一度ビルドするとキャッシュというのが作成される。  
Dockerfileを更新しても、--no-cache オプションを付けないと Dockerはキャッシュを使ってimageを構築するので、変更内容が反映されない。

### up
キャッシュがある場合はそれを使って一発でイメージの構築から、コンテナの構築・起動までする。  
imageがなくてもbuildから実行してくれる。  
（build コマンド同様、Dockerfileを更新しても反映されない。）  

```
docker-compose up -d --build
```
の方が良さそう。


## --build オプション
Dockerfile or ビルド処理の変更を反映させる  
（これが無いと、キャッシュから起動する。多分）  


### start
既存のコンテナを起動する。
```
docker-compose start
```


### run
imageの構築から、コンテナの構築・起動までしてくれる。  
引数でサービスを指定しないと失敗する。  
```
docker-compose run -d web
```

