class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def slug
    self.username.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(name)
    user = User.find {|user| user.slug == name}
  end
end
