swagger_sample01.yml


# Swagger

## Swagger Editor
https://editor.swagger.io/


## Swagger API sample
https://app.swaggerhub.com/apis/kakisoft/CreateNewAPI01/1.0.0


## OpenAPI について
https://future-architect.github.io/articles/20191008/


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

```
npm install -g redoc-cli

redoc-cli bundle [Swaggerファイル]
redoc-cli bundle [Swaggerファイル] -o [出力ファイル名]

redoc-cli bundle swagger_sample01.yml
redoc-cli bundle swagger_sample01.yml -o redoc-cli_sample/index.html
```

