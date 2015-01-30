require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  let(:user) { create :user }
  before do
    assign :user, user
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the user namespace' do
    expect(subject).to include('user')
  end

  context 'properties' do
    subject { JSON.parse(rendered)['user'] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(user.id) }

    it { is_expected.to include('username') }
    it { expect(subject['username']).to eql(user.username) }

    it { is_expected.to include('firstName') }
    it { expect(subject['firstName']).to eql(user.first_name) }

    it { is_expected.to include('lastName') }
    it { expect(subject['lastName']).to eql(user.last_name) }

    it { is_expected.to include('devices') }
    it { expect(subject['devices']).to eql(user.device_ids) }
  end
end
