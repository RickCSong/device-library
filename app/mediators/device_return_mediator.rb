class DeviceReturnMediator
  include ActiveModel::Model

  attr_accessor :device

  validates :device,
            presence: true

  validate :device_is_checked_out

  def save
    if valid?
      device.update(status: :available, user_id: nil)
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