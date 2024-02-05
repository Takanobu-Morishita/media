# リポジトリをクローン
1. docker アプリを立ち上げる
2. rails_docker_appに移動する
   ```
   cd rails_docker_app
   ```
5.ビルドする
   ```
   docker-compose build
   ```
7.サーバ立ち上げ
   ```
   docker-compose up
   ```
9. railsに入る
   ```
   docker compose exec web bash
   ```
# データベース準備  
1.```
   rails db:create
   ```
3. rails db:migrate
4. rails db:seed
# ブランチ作成 
1. git branch ブランチ名
2. git checkout ブランチ名
# プルリクエスト
1. git add .
2. git commit -m 'メッセージ'
3. git push origin ブランチ名
# Docker を消去
1. docker-compose down

docker-compose down をして立ち上げるときは、docker-compose build をしてから　up

