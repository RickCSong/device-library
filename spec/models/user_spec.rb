# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  first_name :string(255)
#  last_name  :string(255)
#  role       :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context '#database' do
    it { is_expected.to have_db_index(:username).unique(true) }
  end

  it { is_expected.to define_enum_for(:role).with([:user, :admin, :terminal]) }
  it { is_expected.to have_many(:devices) }

  context '#validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    it { is_expected.to validate_presence_of(:role) }
  end

  describe '#full_name' do
    subject { build(:user, first_name: 'Rick', last_name: 'Song').full_name }

    it { is_expected.to eql('Rick Song') }
  end

  describe '#email' do
    subject { build(:user, username: 'ricksong').email }

    it { is_expected.to eql('ricksong@squareup.com') }
  end
end
