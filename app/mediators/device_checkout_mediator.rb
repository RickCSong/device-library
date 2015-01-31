class DeviceCheckoutMediator
  include ActiveModel::Model

  attr_accessor :device, :user_id

  validates :device,
            presence: true

  validates :user_id,
            presence: true

  validate :device_is_available

  def save
    if valid?
      device.update(status: :checked_out, user_id: user_id)
      # TODO: Create Device Activity Log here
      true
    else
      false
    end
  end

  private

  def device_is_available
    errors.add(:status, 'is not available') unless device.try!(:available?)
  end
end