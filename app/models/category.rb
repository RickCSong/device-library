# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :devices

  validates :name,
            presence: true,
            uniqueness: {case_sensitive: false}

  validates :code,
            presence: true,
            uniqueness: {case_sensitive: false}
end
