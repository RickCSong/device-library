require 'rails_helper'

RSpec.describe DeviceReturnMediator, type: :mediator do
  context '#validations' do
    it { is_expected.to validate_presence_of(:device) }
    it 'validates that device is checked out' do
      device = build(:device, :available)
      device_return_mediator = DeviceReturnMediator.new(device: device)
      expect(device_return_mediator.valid?).to be_falsey
      expect(device_return_mediator.errors[:status]).to include('is not checked out')
    end
  end

  describe '#save' do
    context 'valid' do
      let(:device) { create :device, :checked_out }
      subject { DeviceReturnMediator.new(device: device) }

      it 'updates the device status to available' do
        expect { subject.save }.to change { device.status }.from('checked_out').to('available')
      end

      it 'updates the device owner to nil' do
        expect { subject.save }.to change { device.user_id }.to(nil)
      end

      it 'returns true' do
        expect(subject.save).to be_truthy
      end
    end

    context 'invalid' do
      let(:device) { create :device, :available }
      subject { DeviceReturnMediator.new(device: device) }

      it 'does not update the device' do
        expect { subject.save }.to_not change { device.status }
      end

      it 'returns false' do
        expect(subject.save).to be_falsey
      end

      it 'contains errors regarding device' do
        expect(subject.tap(&:save).errors['status']).to include('is not checked out')
      end
    end
  end
end
