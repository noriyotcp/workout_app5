FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password 'password'
    password_confirmation 'password'
    first_name 'John'
    last_name 'Doe'
  end
end
