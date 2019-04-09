class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  validates :email, uniqueness: true

  def slug
    #google this
  end
end
