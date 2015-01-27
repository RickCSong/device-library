require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { create :user }
  subject { JSON.parse(UserSerializer.new(user).to_json).with_indifferent_access }

  describe 'attributes' do
    it { expect(subject[:user][:id]).to eql(user.id) }
    it { expect(subject[:user][:username]).to eql(user.username) }
    it { expect(subject[:user][:first_name]).to eql(user.first_name) }
    it { expect(subject[:user][:last_name]).to eql(user.last_name) }
  end
end
