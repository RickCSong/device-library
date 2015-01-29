# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    first_name 'Rickilus'
    last_name 'Smith'
    role :user

    trait :admin do
      role :admin
    end

    trait :terminal do
      role :terminal
    end
  end
end
