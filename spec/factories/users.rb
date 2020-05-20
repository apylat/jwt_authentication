FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email_#{n}@example.com"
    end
    password { 'password' }
  end
end
