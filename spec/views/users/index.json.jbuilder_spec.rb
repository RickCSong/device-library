require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  let(:users) { create_list :user, 10 }
  before do
    assign :users, users
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the users namespace' do
    expect(subject).to include('users')
  end

  it 'is an array of all users' do
    expect(subject['users']).to be_an(Array)
    expect(subject['users'].length).to eql(10)
  end

  context 'properties' do
    let(:user) { users[0] }
    subject { JSON.parse(rendered)['users'][0] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(user.id) }

    it { is_expected.to include('username') }
    it { expect(subject['username']).to eql(user.username) }

    it { is_expected.to include('first_name') }
    it { expect(subject['first_name']).to eql(user.first_name) }

    it { is_expected.to include('last_name') }
    it { expect(subject['last_name']).to eql(user.last_name) }

    it { is_expected.to include('devices') }
    it { expect(subject['devices']).to eql(user.device_ids) }
  end
end
