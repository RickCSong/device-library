require 'rails_helper'

RSpec.describe DeviceCheckoutMediator, type: :mediator do
  context '#validations' do
    it { is_expected.to validate_presence_of(:device) }
    it { is_expected.to validate_presence_of(:user_id) }
    it 'validates that device is available' do
      device = build(:device, :checked_out)
      user = build(:user)
      device_checkout_mediator = DeviceCheckoutMediator.new(device: device, user_id: user)
      expect(device_checkout_mediator.valid?).to be_falsey
      expect(device_checkout_mediator.errors[:status]).to include('is not available')
    end
  end

  describe '#save' do
    context 'valid' do
      let(:user) { create :user }
      let(:device) { create :device, :available }
      subject { DeviceCheckoutMediator.new(device: device, user_id: user.id) }

      it 'updates the device status to available' do
        expect { subject.save }.to change { device.status }.from('available').to('checked_out')
      end

      it 'updates the device owner' do
        expect { subject.save }.to change { device.user_id }.from(nil).to(user.id)
      end

      it 'returns true' do
        expect(subject.save).to be_truthy
      end
    end

    context 'invalid' do
      let(:user) { create :user }
      let(:device) { create :device, :checked_out, user_id: user.id }
      subject { DeviceCheckoutMediator.new(device: device, user_id: user.id) }

      it 'does not update the device' do
        expect { subject.save }.to_not change { device.status }
      end

      it 'does not update the device' do
        expect { subject.save }.to_not change { device.user_id }
      end

      it 'returns false' do
        expect(subject.save).to be_falsey
      end

      it 'contains errors regarding device' do
        expect(subject.tap(&:save).errors['status']).to include('is not available')
      end
    end
  end
end
