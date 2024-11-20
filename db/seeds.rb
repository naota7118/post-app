# 管理権限をもつユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@email.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

# その他99人のユーザーをまとめて作成する
99.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character
  email = "#{name}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end