swagger_sample01.yml


# Swagger

## Swagger Editor
https://editor.swagger.io/


## Swagger API sample
https://app.swaggerhub.com/apis/kakisoft/CreateNewAPI01/1.0.0


## OpenAPI について
https://future-architect.github.io/articles/20191008/

________________________________________________________________________________________
# 関連ツール

https://swagger.io/tools/open-source/open-source-integrations/

________________________________________________________________________________________
# ジェネレータ

## bootprint-openapi
https://github.com/bootprint/bootprint-openapi

#### 使い方
```
npm install -g bootprint
npm install -g bootprint-openapi

bootprint openapi <出力したYAMLかJSONファイル> <出力先ディレクトリ>

bootprint openapi swagger_sample01.yml bootprint_sample
```

## redoc
https://github.com/Redocly/redoc

#### 公式デモ
http://redocly.github.io/redoc/

#### 備考
静的ページをジェネレートするわけではなく、Webサーバで動かす事を前提としているみたい


## redoc-cli
https://github.com/Redocly/redoc

#### 使い方
```
npm install -g redoc-cli

redoc-cli bundle <Swaggerファイル>
redoc-cli bundle <Swaggerファイル> -o <出力ファイル名>

redoc-cli bundle swagger_sample01.yml
redoc-cli bundle swagger_sample01.yml -o redoc-cli_sample/index.html
```

#### 備考
マニュアルの説明が簡略化され過ぎて、何書いてるのかよくわかんない  


## Swagger UI

#### 公式デモ
https://petstore.swagger.io/

#### 備考
静的ページをジェネレートするわけではなく、Webサーバで動かす事を前提としているみたい


## spectacle

#### 公式デモ
http://cheesestore.github.io/

#### 使い方
```
npm install -g spectacle-docs
spectacle -d <your_swagger_api.json>
```
使えるのは json のみ？  
yml にしたいんだけど・・・  



## Swagger2Markup

#### 公式デモ
http://swagger2markup.github.io/spring-swagger2markup-demo/1.1.0/


#### 備考
お手軽さを全く感じない。  
yml ファイルからちゃちゃっとページを作る、というレベル感で使う物ではなさそうな気がしてきた。  



