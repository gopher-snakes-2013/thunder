class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validate  :password_is_set
  validate  :email_matches_proper_format

  has_many :suggested_talks, class_name: "Talk", foreign_key: "suggester_id"
  has_many :claimed_talks, class_name: "Talk", foreign_key: "claimant_id"

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  def email_matches_proper_format
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "must be formatted like email@example.com")
    end
  end

  def password_is_set
    if !password || password == ""
      errors.add(:password, "can't be blank")
    end
  end

  def suggest_talk(attributes)
    self.suggested_talks.create(attributes)
  end

  def claim_talk(talk)
    self.claimed_talks << talk
  end

  def self.authenticate(user_hash)
    user = User.find_by_email(user_hash[:email])
    return false unless user && user.password == user_hash[:password]
    user
  end


end
