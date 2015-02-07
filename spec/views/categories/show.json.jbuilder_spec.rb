require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  let(:category) { create :category }
  before do
    assign :category, category
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the category namespace' do
    expect(subject).to include('category')
  end

  context 'properties' do
    subject { JSON.parse(rendered)['category'] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(category.friendly_id) }

    it { is_expected.to include('name') }
    it { expect(subject['name']).to eql(category.name) }

    it { is_expected.to include('code') }
    it { expect(subject['code']).to eql(category.code) }

    it { is_expected.to include('devices') }
    it { expect(subject['devices']).to eql(category.device_ids) }
  end
end
