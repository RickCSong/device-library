class DeviceReturnMediator
  include ActiveModel::Model

  attr_accessor :device

  validates :device,
            presence: true

  validate :device_is_checked_out

  def save
    user = device.user
    old_status = device.status
    new_status = 'available'
    if valid? and device.update(status: :available, user_id: nil)
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

  def device_is_checked_out
    errors.add(:device, 'is not checked out') unless device.try!(:checked_out?)
  end
end
