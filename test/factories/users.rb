FactoryBot.define do
  factory :user do
    id { 100 }
    name { "john" }
    email { "example@email.com" }
    password { "password" }
  end
end
