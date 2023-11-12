# 鍵生成
$ cd .ssh/ | mkdir .ssh | cd .ssh
$ ssh-keygen 　# 鍵を生成する

[.ssh]$ cat id_rsa.vim b
ssh-rsa 
「id_rsa.pub」はサーバー側の鍵/上記
上記をgithubにも登録する必要あり

.ssh]$ vim config

.ssh]$ chmod 600 config

$ git config --global [user.name](http://user.name/) 
$ git config --global user.email [@~.co.jp](mailto:~@~.co.jp)
[ss@stgembulk02 ~]$ ssh -T [git@github.com](mailto:git@github.com)
[ss@stgembulk02 ~]$ git clone  [git@github.com](mailto:git@github.com):~/embulk.git
Cloning

# 最新化
$ git pull origin master # 最新化
$ git add ファイル名 # 追加
$ git status #状況確認
$ git commit # コミット
$ git log　 # 履歴確認
$ git push origin ブランチ名  # リモートへ
