# Windows環境にて Dockerを使用する（Hyper-V）

## Hyper-V を有効化
コントロールパネル → プログラムと機能 → Windowsの機能の有効化または無効化  
にて、「Hyper-V」 のチェックをON。  

その後、再起動。  


## dockerをインストール
Chocolatey（パッケージマネージャー） を使用しています。  
Chocolateyのインストールは[こんな感じ](https://kakistamp.hatenadiary.jp/entry/2017/03/21/230940)で。  
コマンドラインより実行して下さい。
```
choco install -y docker
choco install -y docker-compose
choco install -y docker-for-windows
```

完了。  
　  
dockerコマンドが使用できるようになっています。  

試しに Redmineのコンテナを動かしてみました。  

## Redmineコンテナ起動
```
docker pull redmine
docker run -p 8080:3000 -dti redmine
```
127.0.0.1:8080 にアクセスすると、ログイン画面が表示されます。


## 注意点
 * Hyper-V を ONにすると、virtualbox等の他の仮想環境ツールが上手く動かなくなる。（OFFにすると、再び使用できる。）
 * Hyper-V を仮想マシンとして Vagrantを使う場合、設定が結構面倒。また、Hyper-Vに対応していない Boxも多い。

