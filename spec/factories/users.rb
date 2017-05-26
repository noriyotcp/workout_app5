FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password 'password'
    password_confirmation 'password'
    first_name { generate :first_name }
    last_name { generate :last_name }
  end
end
