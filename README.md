# リポジトリをクローンした後
＊はじめにdockerアプリを立ち上げること  
・rails_docker_appに移動する
```
cd rails_docker_app
```
・ビルドする
```
docker-compose build
```
・サーバを立ち上げる
```
docker-compose up
```
・railsに入る
```
docker compose exec web bash
```
# データベース準備  
・データベースを作成する
```
rails db:create
```
・データベースをテーブルに反映する
```
rails db:migrate
```
・データベースにデータを投入する
```
rails db:seed
```
```
rails db:seed_fu
```
# ブランチ作成 
1. git branch ブランチ名
2. git checkout ブランチ名
# プルリクエスト
1. git add .
2. git commit -m 'メッセージ'
3. git push origin ブランチ名
# Dockerイメージを消去
```
docker-compose down
``` 

docker-compose down をして立ち上げるときは、docker-compose build をしてから　up

