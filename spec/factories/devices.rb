# == Schema Information
#
# Table name: devices
#
#  id               :integer          not null, primary key
#  hardware         :string(255)
#  operating_system :string(255)
#  storage_code     :string(255)      not null
#  barcode          :string(255)      not null
#  status           :integer          default("0"), not null
#  details          :text(65535)
#  user_id          :integer
#  category_id      :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :device do
    hardware 'iPhone 6s'
    operating_system 'iOS 7.1'
    storage_code '0001'
    sequence(:barcode) { |n| "category_code_1_000#{n}" }
    status 'available'
    details 'Random details regarding the device'
    user nil
    category

    trait :available do
      status 'available'
    end

    trait :checked_out do
      status 'checked_out'
      user
    end
  end
end
