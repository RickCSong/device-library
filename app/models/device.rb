# == Schema Information
#
# Table name: devices
#
#  id               :integer          not null, primary key
#  hardware         :string(255)
#  operating_system :string(255)
#  storage_code     :string(255)
#  barcode          :string(255)
#  status           :integer          default("0")
#  details          :text(65535)
#  user_id          :integer
#  category_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Device < ActiveRecord::Base
  enum status: [:available, :maintenance, :checked_out]

  belongs_to :user
  belongs_to :category

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

  # TODO: Validate correctness of barcode.  category_code + storage_code
end
