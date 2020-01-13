# frozen_string_literal: true

require "omniauth"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Wordpress < OmniAuth::Strategies::OAuth2
      option :name, "wordpress"

      option :client_options,
             site: "https://public-api.wordpress.com",
             authorize_url: "/oauth2/authorize",
             token_url: "/oauth2/token",
             user_url: "/rest/v1.1/me"

      def authorize_params
        super.tap do |params|
          params[:client_id] = client.id
          params[:redirect_uri] ||= callback_url
        end
      end

      uid do
        info[:id]
      end

      info do
        {
          id: raw_info.fetch(:ID),
          email: raw_info.fetch(:email),
          name: raw_info.fetch(:display_name)
        }
      end

      extra do
        raw_info
      end

      def token_params
        OmniAuth::Strategy::Options.new(
          code: request.params["code"],
          redirect_uri: callback_url,
          client_id: client.id,
          client_secret: client.secret,
          type: "web_server"
        )
      end

      def raw_info
        @raw_info ||= deep_symbolize(
          access_token.get(client.options[:user_url]).parsed
        )
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
