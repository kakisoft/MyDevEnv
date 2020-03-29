## _
```
mkdir nginx

cd nginx
```

## 構成
```
├── docker/
│   └── web/
│       └── default.conf　# Nginxの設定ファイル
│
├── docker-compose.yml
└── index.html # 配信する静的コンテンツ
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
    volumes:               # Dockerコンテナに共有（マウントと言います）したいファイル群を指定
      - ./docker/web/default.conf:/etc/nginx/conf.d/default.conf    # ホスト側のパス:コンテナ側のパス　
      - .:/var/www/html
```

## docker/web/default.conf
```
server {
    listen 80;

    root  /var/www/html;
    index index.html;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;
}
```

## index.html
```
<h1>Hello Docker Compose!</h1>

<p>I love Laravel and Docker!</p>
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

