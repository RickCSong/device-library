require 'rails_helper'

RSpec.describe 'devices/index', type: :view do
  let(:devices) { create_list :device, 10 }
  before do
    assign :devices, devices
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the devices namespace' do
    expect(subject).to include('devices')
  end

  it 'is an array' do
    expect(subject['devices']).to be_an(Array)
  end

  context 'properties' do
    let(:device) { devices[0] }
    subject { JSON.parse(rendered)['devices'][0] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(device.id) }

    it { is_expected.to include('hardware') }
    it { expect(subject['hardware']).to eql(device.hardware) }

    it { is_expected.to include('operatingSystem') }
    it { expect(subject['operatingSystem']).to eql(device.operating_system) }

    it { is_expected.to include('storageCode') }
    it { expect(subject['storageCode']).to eql(device.storage_code) }

    it { is_expected.to include('barcode') }
    it { expect(subject['barcode']).to eql(device.barcode) }

    it { is_expected.to include('details') }
    it { expect(subject['details']).to eql(device.details) }

    it { is_expected.to include('status') }
    it { expect(subject['status']).to eql(device.status) }

    it { is_expected.to include('category') }
    it { expect(subject['category']).to eql(device.category_id) }

    it { is_expected.to include('user') }
    it { expect(subject['user']).to eql(device.user_id) }
  end
end
