module OmniauthHelper
  def user_from_authhash(auth_hash)

    user = User.find_or_create_by(oauth_provider: auth_hash['provider'], oauth_uid: auth_hash['uid'].to_s)
    user.oauth_token = auth_hash['credentials']['token']

    unless user.persisted?
      user.password = SecureRandom.hex
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.save
    end

    user
  end
end
