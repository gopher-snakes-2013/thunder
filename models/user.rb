class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :password, :presence => true
  validate :email_matches_proper_format


  def email_matches_proper_format
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "must be formatted like email@example.com")
    end
  end

  def self.authenticate(user_hash)
    user = User.find_by_email(user_hash[:email])
    return false unless user && user.password == user_hash[:password]
    user
  end
end
