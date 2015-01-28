require 'rails_helper'

RSpec.describe CategorySerializer, type: :serializer do
  let(:category) { create :category }
  subject { JSON.parse(CategorySerializer.new(category).to_json).with_indifferent_access }

  describe 'attributes' do
    it { expect(subject[:category][:id]).to eql(category.id) }
    it { expect(subject[:category][:name]).to eql(category.name) }
    it { expect(subject[:category][:code]).to eql(category.code) }
  end
end
