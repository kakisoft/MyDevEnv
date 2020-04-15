### Docker Hub
<https://hub.docker.com>

### Imageファイルの取得
```
sudo docker pull <イメージ名>

（例：centosのイメージを取得）
sudo docker pull centos
```

### ローカルのイメージの一覧を確認
```
sudo docker images
```

### コンテナ作成
```
sudo docker run <REPOSITORY:TAG>
```
または
```
sudo docker run <IMAGE ID>

sudo docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:10
```
オプション無しで runを実行した場合、起動後にすぐに終了する。  
バックグラウンドで動作させたい場合、```-td```オプションを使用する。  
```
（よく使うオプション）
-t：疑似ターミナル (pseudo-TTY) を割り当て
-d：コンテナをバックグラウンドで実行（デタッチドモード）
-i：コンテナの STDIN にアタッチ
-p：コンテナのポートをホスト側に公開

--env , -e    Set environment variables
--name		  Assign a name to the container
--link		  Add link to another container
```

### 実行中のコンテナ一覧を表示
```
sudo docker ps
```

### 実行終了したコンテナ一覧を表示
```
sudo docker ps -a
```

### コンテナの削除
```
sudo docker rm <CONTAINER ID>
```
CONTAINER ID は、上記の ```docker ps```にて確認できる。  
CONTAINER ID を指定する時は、先頭X文字を入力するだけでも判別してくれる。

### 実行中のコンテナのログを確認
```
sudo docker logs <CONTAINER ID>
```
### バックグラウンドで実行中のコンテナを、フォアグラウンドに移動
```
sudo docker attach --sig-proxy=false <CONTAINER ID>
```
ctrl+C でコンテナを再びバックグランドに戻す。

### バッググラウンドで実行中のコンテナにログイン
```
sudo docker exec -it <CONTAINER ID> /bin/bash
```

### ユーザ名を指定してログイン
```
sudo docker exec -u root -it odoo /bin/bash
```

### 実行中のコンテナを停止
```
sudo docker kill <CONTAINER ID>
```

### 停止したコンテナを再開
```
sudo docker start <CONTAINER ID>

--attach , -a		Attach STDOUT/STDERR and forward signals
```

### コンテナの削除
```
sudo docker rm <CONTAINER ID>
```

### 停止中のコンテナを全て削除
```
sudo docker rm `sudo docker ps -a -q`
```

### コンテナを起動し、内部で作業する
```
sudo docker run -it <REPOSITORY:TAG> /bin/bash/bin/bash
```
	
### ホストのポートをコンテナのポートにリダイレクト
以下では、ホストのポート8080を、コンテナの80にリダイレクト。
```
sudo docker run -p 8080:80 -d <イメージ名>
```

## 実行中以外のコンテナの残骸をまとめて削除
```
docker container prune
```
