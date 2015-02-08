# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  first_name :string(255)
#  last_name  :string(255)
#  role       :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  enum role: [:user, :admin, :terminal]

  has_many :devices
  has_many :activities

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false}

  validates :role,
            presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def email
    "#{username}@squareup.com"
  end
end
