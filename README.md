# リポジトリをクローン
1. docker アプリを立ち上げる
2. docker-compose build
3. docker-compose up -d
4. docker ps でコンテナ名を調べる
5. docker exec -it コンテナ名 sh
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
