## 各種バージョン
- ruby: 2.6.1
- rails: 5.2.2
- Postgresql: 10

## Postgresql
app / Va+34yMw

## 起動方法
### Dockerの初回起動
```
$ docker-compose up -d --build
```

### Dockerの起動(2回目以降)
```
$ docker-compose up -d
```

### appコンテナに入る
```
$ docker-compose exec app /bin/bash
```

### ビルトインサーバの立ち上げ('localhost:3000')
```
# appコンテナにて
# bin/rails s
```

### Rspecをかける
```
# appコンテナにて
# rspec
```

### Robocopによる自動整形
```
# appコンテナにて
# rubocop -a
```

### コンテナから抜ける
```
# exit
```