# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  enum role: [:user, :admin, :terminal]

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false}

  def full_name
    "#{first_name} #{last_name}"
  end

  def email
    "#{username}@squareup.com"
  end
end
