# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#１つずつテストデータを追加する場合

30.times do |n|
    User.create!(
        email: "#{n + 1}@a",
        encrypted_password: "#{n + 1}"*6,
        username: "user#{n + 1}",
        profile: "#{n + 1}",
)

    Post.create!(
            title: "test#{n + 1}人目",
            body: "test#{n + 1}回目",
            genre: "test#{n + 1}@test.com",
            user_id: "#{n + 1}",
    )

end