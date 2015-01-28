# == Schema Information
#
# Table name: devices
#
#  id               :integer          not null, primary key
#  hardware         :string(255)
#  operating_system :string(255)
#  storage_code     :string(255)
#  barcode          :string(255)
#  status           :integer          default("0")
#  details          :text(65535)
#  user_id          :integer
#  category_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Device, type: :model do
  context '#database' do
    it { is_expected.to have_db_index(:category_id) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:barcode).unique(true) }
  end

  it { is_expected.to define_enum_for(:status).with([:available, :in_maintenance, :checked_out]) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:user) }

  context '#validations' do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:hardware) }
    it { is_expected.to validate_presence_of(:operating_system) }
    it { is_expected.to validate_presence_of(:storage_code) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:barcode) }
    it { is_expected.to validate_uniqueness_of(:barcode).case_insensitive }
  end
end
