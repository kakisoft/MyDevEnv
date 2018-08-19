## インストール
```
『epel download』で検索。（EPEL）
右クリック→リンク先のアドレスをコピー

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh epel-release-latest-7.noarch.rpm
sudo yum -y install ansible
ansible --version
```

## 実行
``
ansible-playbook my-playbook01.yml
``