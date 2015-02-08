# == Schema Information
#
# Table name: devices
#
#  id               :integer          not null, primary key
#  hardware         :string(255)
#  operating_system :string(255)
#  storage_code     :string(255)      not null
#  barcode          :string(255)      not null
#  status           :integer          default("0"), not null
#  details          :text(65535)
#  user_id          :integer
#  category_id      :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Device < ActiveRecord::Base
  enum status: [:available, :in_maintenance, :checked_out]

  belongs_to :user
  belongs_to :category
  has_many :activities

  validates :category,
            presence: true

  validates :hardware,
            presence: true

  validates :operating_system,
            presence: true

  validates :status,
            presence: true

  validates :storage_code,
            presence: true

  validates :barcode,
            presence: true,
            uniqueness: {case_sensitive: false}

  validate :checked_out_by_user?
  # TODO: Validate correctness of barcode.  category_code + storage_code

  private

  def checked_out_by_user?
    errors.add(:status, 'has to be checked out by a user') if checked_out? && user_id.blank?
  end
end
