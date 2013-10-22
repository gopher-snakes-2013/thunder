OmniAuth.config.test_mode = true

def stub_out_unregistered_github_user
  user_attributes = random_unregistered_github_user_attributes

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid => user_attributes[:uid],
    :credentials => {
      :token => user_attributes[:oauth_token]
    },
    :info => {
      :name => user_attributes[:name],
      :email => user_attributes[:email]
    }
  })

  # These are based off of the code from the omniauth-github strategy
  # https://github.com/intridea/omniauth-github/blob/master/lib/omniauth/strategies/github.rb#L26

  user_attributes
end
