FactoryBot.define do
    factory :user do
      username { "MyString" }
      password { "MyString" }
      firstname { "MyString" }
      lastname { "MyString" }
      email { "#{firstname}.#{lastname}@example.com".downcase }
    isAdmin {false}
    verified {false}
    end
  end