FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2020-05-15 12:08:44" }
  end
end
