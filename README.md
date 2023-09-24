# リポジトリをクローン
1. docker アプリを立ち上げる
2. cd rails_docker_app
3. docker-compose build
4. docker-compose up -d
5. docker ps でコンテナ名を調べる
6. docker exec -it コンテナ名 sh
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
# Google Slide
https://docs.google.com/presentation/d/18S8sK6JKS8-c_U1QtgzXisFpgaY4sjfDI1VV6mw0hD8/edit?pli=1#slide=id.g245512e8551_0_20
