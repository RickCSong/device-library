# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  code       :string(255)      not null
#  slug       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :devices

  validates :name,
            presence: true,
            uniqueness: {case_sensitive: false}

  validates :code,
            presence: true,
            uniqueness: {case_sensitive: false}
end
