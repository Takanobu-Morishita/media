# 手順
1. リポジトリをクローン
1. docker アプリを立ち上げる
1. docker-compose build
1. docker-compose up -d
1. docker ps でコンテナ名を調べる
1. docker exec -it コンテナ名 sh
1. rails db:create
rails db:migrate
rails db:seed
