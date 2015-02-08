require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:categories) { create_list :category, 10 }
  before do
    assign :categories, categories
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the categories namespace' do
    expect(subject).to include('categories')
  end

  it 'is an array of all categories' do
    expect(subject['categories']).to be_an(Array)
    expect(subject['categories'].length).to eql(10)
  end

  context 'properties' do
    let(:category) { categories[0] }
    subject { JSON.parse(rendered)['categories'][0] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(category.id) }

    it { is_expected.to include('name') }
    it { expect(subject['name']).to eql(category.name) }

    it { is_expected.to include('code') }
    it { expect(subject['code']).to eql(category.code) }

    it { is_expected.to include('devices') }
    it { expect(subject['devices']).to eql(category.device_ids) }
  end
end
