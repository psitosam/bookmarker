FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@testemail.test" }
    password { 'password' }
  end
end
