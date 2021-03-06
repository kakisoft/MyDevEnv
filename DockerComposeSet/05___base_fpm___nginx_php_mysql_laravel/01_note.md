いまのとこ、  
04_nginx_php_mysql_laravel  
を使った方がよさそう。  

## _
```
mkdir laravel-docker-workspace

cd laravel-docker-workspace
```

## 起動・終了
```
docker-compose up -d
docker-compose down

※Linuxの場合、sudo で。
```

## コンテナにタッチして作業
※Ubuntu だと composer が not found だった。
``
docker-compose exec app bash
docker-compose exec --user root app bash

バージョンを指定しない場合（最新版がインストールされる）
composer create-project --prefer-dist laravel/laravel my-laravel-app


バージョンを指定する場合
composer create-project --prefer-dist  "laravel/laravel=5.5" my-laravel-app
```

## docker/web/default.conf 編集
※ プロジェクト名に注意してね。（my-laravel-app）  
```
#    root  /var/www/html;
    root  /var/www/html/my-laravel-app/public;
```

## LaravelをMySQLと接続
.env ファイルを編集。（上記では、/my-laravel-app/.env ）
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret

     ↓

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=sample_db01
DB_USERNAME=user
DB_PASSWORD=password
```
＜パラメータ解説（推測）＞  
DB_CONNECTION=mysql は、「DBにMySQLを使います」という意味。ポスグレ使うなら、potgresとか？  
DB_HOST=mysql は、docker-compose.yml の「mysql:」。DB名とは無関係。（多分）  
DB_DATABASE=sample  は、MySQL の DB名になるので、お好みで。（その時は docker-compose.yml も変更を）

## 再起動
```
docker-compose restart
```

## マイグレーション
```
docker-compose exec app bash
cd my-laravel-app
php artisan migrate
```


## アクセス
```
http://localhost:8000/
```

_______________________________________________________________________________________________
_______________________________________________________________________________________________
_______________________________________________________________________________________________
## 構成
```
├── docker
│   ├── php
│   │   └── Dockerfile
│   └── web
│       └── default.conf    # Nginxの設定ファイル
├── docker-compose.yml
├── index.html               # 配信する静的コンテンツ
└── index.php                # 配信する静的コンテンツ
```

## 備考
```
nginx の設定ファイルはローカルにて編集し、
コンテナ起動時にコンテナにコピーする。
```

## Dockerfile
※追加
```
FROM php:7.2.12-fpm

# install composer
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
RUN apt-get update \
&& apt-get install -y \
git \
zip \
unzip \
vim

RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql

WORKDIR /var/www/html
```

## docker-compose.yml 
```yml
version: '3'
services:
  web:
    image: nginx:1.15.6    # 公式で配布されているnginxを指定
    ports:
      - "8000:80"          # ホスト側のポート:コンテナ側のポート（ホストの 8000 を、コンテナの 80 にリダイレクト）
    depends_on:   # 依存関係を定義するオプション。今回の場合、NginxがPHPを実行するため、NginxがPHPに依存。
      - app
    volumes:               # Dockerコンテナに共有（マウントと言います）したいファイル群を指定
      - ./docker/web/default.conf:/etc/nginx/conf.d/default.conf    # ホスト側のパス:コンテナ側のパス　
      - .:/var/www/html
  app:    # サービス名はappとする
  ########################## ↓↓↓↓↓今回追加した部分↓↓↓↓↓ #################################
  #  image: php:7.2.12-fpm
    build: ./docker/php #定義したDockerfileを元にイメージを作るように変更
  ########################## ↑↑↑↑↑今回追加した部分↑↑↑↑↑ #################################
    depends_on:
    - mysql
    volumes:
      - .:/var/www/html
  mysql:
    image: mysql:5.7
    environment:
      MYSQL_DATABASE: sample
      MYSQL_USER: user
      MYSQL_PASSWORD: password
      MYSQL_ROOT_PASSWORD: password
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
volumes:
  mysql-data:
```
 * environmentによって、MySQLの情報を定義している。
 * volumesによって、mysqlのデータの永続化を行なっている。

## docker/web/default.conf
```
server {
    listen 80;

    root  /var/www/html;
    index index.php index.html index.htm;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
          fastcgi_split_path_info ^(.+\.php)(/.+)$;
          fastcgi_pass   app:9000;
          fastcgi_index  index.php;

          include        fastcgi_params;
          fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
          fastcgi_param  PATH_INFO $fastcgi_path_info;
      }
}
```
PHP-FPMはデフォルトでポート 9000番で起動するのでfastcgi_passではapp:9000と指定すれば、docker内で名前解決してくれます。


## ndex.php
※php
```
<h1>Hello Docker Compose!</h1>

<p>I love Laravel and Docker!</p>

<?php phpinfo();?>
```
____________________________
＜参考サイト＞
## Laravelの環境
https://windii.jp/laravel/laravel-with-docker-compose


## Nginx設定のまとめ
https://qiita.com/syou007/items/3e2d410bbe65a364b603


## nginxについてまとめ(設定編)
https://qiita.com/morrr/items/7c97f0d2e46f7a8ec967
