https://mseeeen.msen.jp/windows-10-set-alias-automatically-in-powershell/

## 管理者権限で PowerShell を起動し、下記のコマンドを実行します。
```
Set-ExecutionPolicy RemoteSigned -Force
```

## プロファイルの作成とエイリアスの定義
※２回目以降は、２番目のコマンドだけでいい。というかそうしないと編集したファイルがクリアされる。
```
New-Item –type file –force $profile
notepad $profile
```

## 開いたファイルにエイリアスを記述
※「node my-script01.js」のように、引数があると上手く動かない
```
Set-Alias dc docker-compose
Set-Alias d docker
Set-Alias g git
```


## 引数がある場合
こんな感じで関数として書く
```
function miup(){
  node C:\kaki\script\myapp-launch-manager.js up
}

function midown(){
  node C:\kaki\script\myapp-launch-manager.js down
}


//========================
function dc(){
  docker container $args
}
// dc ls -a # docker container ls -a


/========================
function de(){
  docker exec -it myapp_1 sh
}
```


