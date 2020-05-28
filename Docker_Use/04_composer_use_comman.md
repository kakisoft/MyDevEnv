dockerコンテナの構築を Dockerfileで行い、docker-composeでオーケストレーション

## 起動・終了
```
docker-compose up -d
docker-compose down

※バックグラウンドで起動
```
Ctrl-C で終了した場合、```tmp/pids/server.pid``` を削除し、再起動。  
再起動は、docker-compose up


## 終了時にコンテナを削除
```
docker-compose down --rmi all
docker-compose down --rmi all --volumes
```
※ データベース名（MYSQL_DATABASE）を変更した場合、「--volumes」で丸ごと削除してから、また作り直した方がよさそう。


## 再起動
```
docker-compose restart
```

## コンテナログイン
https://docs.docker.com/compose/reference/exec/
```
exec [options] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]

（例）
docker-compose exec app bash
```


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


