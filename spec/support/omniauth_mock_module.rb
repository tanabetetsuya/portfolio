module OmniauthMockModule
  def google_oauth_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: 'google_oauth2',
      uid: 123456789,
      info: {
        :name => "google_test_user",
        :email => "test_google@test.com"
      },
      credentials: {
        token: 'google_token'
      }
      )
  end

  def twitter_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      provider: 'twitter',
      uid: 123456780,
      info: {
        :name => "twitter_test_user",
        :email => "test_twitter@test.com"
      },
      credentials: {
        token: 'twitter_token'
      }
      )
  end
end