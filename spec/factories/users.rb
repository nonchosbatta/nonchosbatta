FactoryGirl.define do
  factory :user do
    first_name 'Kimi'
    last_name 'Aoi'
    sequence(:email) { |n| "kimi#{n}@mozestudio.com" }
    password 'uzume1648'
    password_confirmation 'uzume1648'
    confirmed_at 1.hour.ago
  end
end
