## Compose file
https://docs.docker.com/compose/compose-file/compose-file-v3/


##  Docker-docs-ja : compose
https://docs.docker.jp/compose/

______________________________________________________________________
______________________________________________________________________
______________________________________________________________________
## docker-compose depends_onとlinksの違い
https://qiita.com/sivertigo/items/9baa73d922a68788402b  

docker-compose.ymlでversion:'2'を指定すれば、以上の違いはなくなるそうです。  



## depends_on （サービスの依存関係）
http://docs.docker.jp/compose/compose-file.html  

docker-compose up を実行したら、依存関係のある順番に従ってサービスを起動します。  
以下の例では、 web を開始する前に db と redis を実行します。  

docker-compose up サービス（の名称） を実行したら、自動的に サービス の依存関係を処理します。  
以下の例では、 docker-compose up web を実行したら、 db と redis も作成・起動します。  

簡単なサンプル：  
```yml
version: '2'
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```


## コンテナ名を指定
container_name
```yaml
  app:
    build: ./docker/php
    depends_on:
    - mysql
    volumes:
      - .:/var/www/html
    container_name: myapp
    user: www-data
```


## コンテナログイン時のデフォルトユーザを指定
user
```yaml
services:

# 中略

  app:
    build: ./docker/php
    depends_on:
    - mysql
    volumes:
      - .:/var/www/html
    user: www-data

# 以下略
```
