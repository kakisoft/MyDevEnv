Dockerは、軽量な仮想化環境を実現するツール。  
2017年8月現在、以下のエディションがある。  
　- CE（Community Edition）：無償  
　- EE（Enterprise Edition）：有償
　  　  
以下、OSは Ubuntu 14.04.5 を使用しています。

### Docker CE をインストール
```
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
```

### バージョン確認
```
docker --version
```

### Docker Image検索
```
sudo docker search <検索ワード>

（例：centosのイメージを検索）
sudo docker search centos
```

### イメージの詳細を確認
```
sudo docker inspect <REPOSITORY:TAG>

（例）
sudo docker inspect centos:latest
```
TAGは省略可能で、その時は latestとなる。  
以下のようにIMAGE ID指定でもOK。
```
sudo docker inspect <IMAGE ID>

（例）
sudo docker inspect 328edcd84f1b
```
REPOSITORY、TAG、IMAGE IDは、上記の```sudo docker images```にて確認できる。

### イメージの削除
```
sudo docker rmi <REPOSITORY:TAG>
```
または
```
sudo docker rmi <IMAGE ID>
```

