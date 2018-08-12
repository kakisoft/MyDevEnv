## CentOS 7
 * CentOS Linux release 7.4.1708 (Core)
 * Apache/2.4.6 (CentOS)
 * mysqld  Ver 5.7.23 for Linux on x86_64 (MySQL Community Server (GPL))
 * PHP 5.6.37 (cli) (built: Jul 19 2018 20:06:19)
 * PEAR Version: 1.10.5
 * Ethna 2.5.0 (using PHP 5.6.37)
 * Smarty 2.6.30

## コマンド
```
mkdir VM02
cd VM02

vagrant box add VM02 VM02.box
vagrant init VM02

vagrant up
```

## その他設定
#### 共有フォルダ
```
＜ホスト＞
./shared

＜ゲスト＞
/vagrant/shared
```
その他の設定は、以下を参照。  
<https://kakisoft.github.io/MiscellaneousDocs/InfraAndEnv_Tool_Service/Vagrant/Vagrant_note04_use2_shareFolder/>

#### Apache：DocumentRoot
```
DocumentRoot "/vagrant/shared"
```

## 備考
起動時に、Apache、MySQLが自動的に起動します。


