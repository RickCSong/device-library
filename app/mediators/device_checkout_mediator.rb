class DeviceCheckoutMediator
  include ActiveModel::Model

  attr_accessor :device, :user

  validates :device,
            presence: true

  validates :user,
            presence: true

  validate :device_is_available

  def save
    old_status = device.status
    new_status = 'checked_out'
    if valid? and device.update(status: :checked_out, user: user)
      Activity.create(
        device: device,
        user: user,
        status_from: old_status,
        status_to: new_status
      )
      true
    else
      false
    end
  end

  private

  def device_is_available
    errors.add(:device, 'is not available') unless device.try!(:available?)
  end
end
