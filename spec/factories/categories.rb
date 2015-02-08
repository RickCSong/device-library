# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  code       :string(255)      not null
#  slug       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category_#{n}" }
    sequence(:code) { |n| "category_code_#{n}" }
  end
end
