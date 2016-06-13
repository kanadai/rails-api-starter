# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin, class: User do
    name 'Admin'
    email 'admin@example.com'
    password 'PASSWORD'
    role nil # FactoryGirl.create(:role_admin)
  end

  factory :user do
    sequence(:name) { |n| "User-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:password) { |n| "PASSWORD_user-#{n}" }
    role nil # FactoryGirl.create(:role_user)
  end
end
