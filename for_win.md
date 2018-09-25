# 基本設定
 * Windows 10 Proにアップデート
 * パスワードを設定
 * コンピュータ名を変更
 * パーティションを分ける（[Winキー]→ディスクの管理）


# 各種ツール

## Chocolateyインストール
（管理者モードで PowerShellを起動。[winマーク] + X → A）
```
Set-ExecutionPolicy RemoteSigned
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```
packages.config をコピー。  
packages.config が存在するフォルダにて、以下を実行。
```
cinst -y packages.config
```

# Chrome拡張
 * Advanced REST Client
 * Mate Translate
 * Lighthouse
 * ColorPick Eyedropper  


# その他（必要に応じて）
 * IME：MyIME.txt
 * Officeリボン：MyExcel2010Customizations.exportedUI
 * C#スニペット：tryf.snippet



