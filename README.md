# README

RailsのテストをRSpecを書く練習をするためのリポジトリ  

* Ruby version: 2.4.1
* Rails version: 5.1.6
* rspec-rails version: 3.8.0

環境構築はDockerを用いている。(DBはmysqlを使用)  
このリポジトリをcloneした後、

```
$ docker-compose up -d
```

をすると環境が立ち上がる。  
初回起動時はrailsコマンドによるDBの設定が必要。

```
$ docker exec -it <webコンテナ名> bash
# rails db:create
```

MIT License
