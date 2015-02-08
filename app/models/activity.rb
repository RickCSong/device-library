class Activity < ActiveRecord::Base
  VALID_STATUSES = %w(available in_maintenance checked_out)

  belongs_to :user
  belongs_to :device

  validates :user,
            presence: true

  validates :device,
            presence: true

  validates :status_from,
            presence: true,
            inclusion: {in: VALID_STATUSES}

  validates :status_to,
            presence: true,
            inclusion: {in: VALID_STATUSES}
end
