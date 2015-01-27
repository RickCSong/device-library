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
