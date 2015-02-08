require 'rails_helper'

RSpec.describe Activity, type: :model do
  context '#database' do
    it { is_expected.to have_db_index(:device_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:device) }

  context '#validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:device) }
    it { is_expected.to validate_presence_of(:status_from) }
    it { is_expected.to validate_inclusion_of(:status_from).in_array(%w(available in_maintenance checked_out)) }
    it { is_expected.to validate_presence_of(:status_to) }
    it { is_expected.to validate_inclusion_of(:status_to).in_array(%w(available in_maintenance checked_out)) }
  end
end
