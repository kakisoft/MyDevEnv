dockerコンテナの構築を Dockerfileで行い、docker-composeでオーケストレーション

## 起動・終了
```
docker-compose up -d
docker-compose down

※バックグラウンドで起動
```
Ctrl-C で終了した場合、```tmp/pids/server.pid``` を削除し、再起動。  
再起動は、docker-compose up

## 再起動
```
docker-compose restart
```

_____________________________________________________________________________________
## Docs > Docker Compose > コマンドライン・リファレンス > up
<https://docs.docker.com/compose/reference/up/>  
<http://docs.docker.jp/compose/reference/up.html>  
```
オプション:
    -d     デタッチド・モード: バックグラウンドでコンテナを実行し、新しいコンテナ名を表示
```


