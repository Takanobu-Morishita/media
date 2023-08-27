# 手順
リポジトリをクローン
docker アプリを立ち上げる
docker-compose build
docker-compose up -d
docker ps でコンテナ名を調べる
docker exec -it コンテナ名 sh
rails db:create
rails db:migrate
rails db:seed
