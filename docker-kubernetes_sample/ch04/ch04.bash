#!/usr/bin/env bash

set -ex

for repo in "tododb" "todoweb" "todonginx" "todoapi"
do
    git clone "https://github.com/gihyodocker/$repo"
done

cp ../ch03/ch03_5_1/docker-compose.yml .
docker-compose up -d

worker_job=$(docker container exec -it manager docker swarm init \
    | sed -ne 's/\(docker swarm join --token [^ ]*\).*/\1/gp')

for workers in "worker01" "worker02" "worker03"
do
    docker container exec -it $workers $worker_job manager:2377
done

# todo〜の作成

docker container exec -it manager docker network create --driver=overlay --attachable todoapp

for dir in "todoapi" "todoweb" "tododb"
do
    (
        cd $dir
        docker image build -t ch04/"$dir":latest .
        docker image tag ch04/"$dir":latest localhost:5000/ch04/"$dir":latest
        docker image push localhost:5000/ch04/"$dir":latest
    )
done

# todonginx作成

(
    cd ./todonginx/
    docker image build -t ch04/nginx:latest .
    docker image tag ch04/nginx-nuxt:latest localhost:5000/ch04/nginx:latest
    docker image push localhost:5000/ch04/nginx:latest
)

cp ./ch04_5_3/Dockerfile-nuxt ./todonginx/
cp ./ch04_5_3/nuxt.conf.tmpl ./todonginx/etc/nginx/conf.d/

(
    cd ./todonginx/
    docker image build -f Dockerfile-nuxt -t ch04/nginx-nuxt:latest .
    docker image tag ch04/nginx-nuxt:latest localhost:5000/ch04/nginx-nuxt:latest
    docker image push localhost:5000/ch04/nginx-nuxt:latest
)

# docker stack deploy向けのデータ作成

cp -t ./stack/ ./ch04_*/todo-*.yml

(
    cd ./stack/
    for todoyml in todo-*.yml
    do
        docker container exec -it manager \
            docker stack deploy -c /stack/"$todoyml" $(echo $todoyml | sed -e 's/todo-\(.*\).yml/todo_\1/')
    done
)

sleep 180s

# データベースの初期化

dbcontainer_node=$(docker container exec -it manager docker service ps todo_mysql_master --no-trunc --filter 'desired-state=running' --format '{{.Node}}' | tr -cd ' [:alnum:]._-')
dbcontainer_name_id=$(docker container exec -it manager docker service ps todo_mysql_master --no-trunc --filter 'desired-state=running' --format '{{.Name}}.{{.ID}}' | tr -cd ' [:alnum:]._-')

docker container exec -it "$dbcontainer_node" docker container exec -it "$dbcontainer_name_id" init-data.sh

# docker container exec -it "$dbcontainer_node" docker container exec -it "$dbcontainer_name_id" mysql -u gihyo -pgihyo tododb

echo "
# composeとめてファイル削除
docker-compose stop;docker-compose rm -f
rm -rf tododb todoweb todonginx todoapi stack registry-data docker-compose.yml
"
