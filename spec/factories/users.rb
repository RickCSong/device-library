FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}"}
    first_name 'Rickilus'
    last_name 'Smith'
    role :user
  end
end
