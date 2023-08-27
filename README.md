# 手順
1. リポジトリをクローン
2. docker アプリを立ち上げる
3. docker-compose build
4. docker-compose up -d
5. docker ps でコンテナ名を調べる
6. docker exec -it コンテナ名 sh
# データベース準備  
1. rails db:create
2. rails db:migrate
3. rails db:seed
