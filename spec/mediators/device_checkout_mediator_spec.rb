require 'rails_helper'

RSpec.describe DeviceCheckoutMediator, type: :mediator do
  context '#validations' do
    it { is_expected.to validate_presence_of(:device) }
    it { is_expected.to validate_presence_of(:user) }
    it 'validates that device is available' do
      device = build(:device, :checked_out)
      user = build(:user)
      device_checkout_mediator = DeviceCheckoutMediator.new(device: device, user: user)
      expect(device_checkout_mediator.valid?).to be_falsey
      expect(device_checkout_mediator.errors[:device]).to include('is not available')
    end
  end

  describe '#save' do
    context 'valid' do
      let(:user) { create :user }
      let(:device) { create :device, status: :available }
      subject { DeviceCheckoutMediator.new(device: device, user: user) }

      it 'updates the device status to available' do
        expect { subject.save }.to change { device.status }.from('available').to('checked_out')
      end

      it 'updates the device owner' do
        expect { subject.save }.to change { device.user_id }.from(nil).to(user.id)
      end

      it 'creates a new activity entry' do
        status_from = device.status
        expect { subject.save }.to change { Activity.count }.by(1)
        activity = Activity.last
        expect(activity.user).to eql(user)
        expect(activity.device).to eql(device)
        expect(activity.status_from).to eql(status_from)
        expect(activity.status_to).to eql('checked_out')
      end

      it 'returns true' do
        expect(subject.save).to be_truthy
      end
    end

    context 'invalid' do
      let(:user) { create :user }
      let(:device) { create :device, status: :checked_out, user: user }
      subject { DeviceCheckoutMediator.new(device: device, user: user) }

      it 'does not update the device status' do
        expect { subject.save }.to_not change { device.status }
      end

      it 'does not update the device user' do
        expect { subject.save }.to_not change { device.user_id }
      end

      it 'does not create a new activity entry' do
        expect { subject.save }.to_not change { Activity.count }
      end

      it 'returns false' do
        expect(subject.save).to be_falsey
      end

      it 'contains errors regarding device' do
        expect(subject.tap(&:save).errors['device']).to eql(['is not available'])
      end
    end
  end
end
