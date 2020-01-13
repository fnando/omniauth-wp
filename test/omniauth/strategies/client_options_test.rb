# frozen_string_literal: true

require "test_helper"

class ClientOptionsTest < Minitest::Test
  let(:app) { ->(env) { } }

  let(:strategy) do
    OmniAuth::Strategies::Wordpress.new(app, "consumer_id", "consumer_secret")
  end

  test "sets name" do
    assert_equal "wordpress", strategy.options.name
  end

  test "sets site url" do
    assert_equal "https://public-api.wordpress.com",
                 strategy.options.client_options.site
  end

  test "sets authorize url" do
    assert_equal "/oauth2/authorize",
                 strategy.options.client_options.authorize_url
  end

  test "sets token url" do
    assert_equal "/oauth2/token",
                 strategy.options.client_options.token_url
  end

  test "sets user url" do
    assert_equal "/rest/v1.1/me",
                 strategy.options.client_options.user_url
  end
end
