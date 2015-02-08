FactoryGirl.define do
  factory :activity do
    user
    device
    status_from 'available'
    status_to 'checked_out'
  end
end
