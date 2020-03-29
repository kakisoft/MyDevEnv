## _
```
mkdir nginx_php

cd nginx_php
```

## 構成
```
├── docker/
│   └── web/
│       └── default.conf　# Nginxの設定ファイル
│
├── docker-compose.yml
└── index.html # 配信する静的コンテンツ
└── index.php  # 配信する静的コンテンツ
```

## 備考
```
nginx の設定ファイルはローカルにて編集し、
コンテナ起動時にコンテナにコピーする。
```

## docker-compose.yml 
```
version: '3'
services:
  web:
    image: nginx:1.15.6    # 公式で配布されているnginxを指定
    ports:
      - "8000:80"          # ホスト側のポート:コンテナ側のポート（ホストの 8000 を、コンテナの 80 にリダイレクト）
  ########################## 今回追加した部分 #################################
    depends_on:   # 依存関係を定義するオプション。今回の場合、NginxがPHPを実行するため、NginxがPHPに依存。
      - app
  #############################################################################
    volumes:               # Dockerコンテナに共有（マウントと言います）したいファイル群を指定
      - ./docker/web/default.conf:/etc/nginx/conf.d/default.conf    # ホスト側のパス:コンテナ側のパス　
      - .:/var/www/html
  ########################## 今回追加した部分 #################################
  app:    # サービス名はappとする
    image: php:7.2.12-fpm
    volumes:
      - .:/var/www/html
  #############################################################################
```

## docker/web/default.conf
```
server {
    listen 80;

    root  /var/www/html;
    index index.php index.html index.htm;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

    ########################## 今回追加した部分 #################################
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
    #############################################################################
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

## 起動
```
docker-compose up -d

※Linuxの場合、sudo で。
```

## アクセス
```
http://localhost:8000/
```

____________________________
＜参考サイト＞
## Laravelの環境
https://windii.jp/laravel/laravel-with-docker-compose#Nginx


## Nginx設定のまとめ
https://qiita.com/syou007/items/3e2d410bbe65a364b603


## nginxについてまとめ(設定編)
https://qiita.com/morrr/items/7c97f0d2e46f7a8ec967
