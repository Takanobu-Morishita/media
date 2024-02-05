# リポジトリをクローン
1. docker アプリを立ち上げる
2. cd rails_docker_app
3. docker-compose build
4. docker-compose up -d
5. railsに入る
   docker compose exec app bash
7. docker ps でコンテナ名を調べる
8. docker exec -it コンテナ名 sh
# データベース準備  
1. rails db:create
2. rails db:migrate
3. rails db:seed
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

