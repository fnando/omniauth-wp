# Omniauth::Wordpress

[![Travis-CI](https://travis-ci.org/fnando/omniauth-wp.svg)](https://travis-ci.org/fnando/omniauth-wp)
[![CodeClimate](https://codeclimate.com/github/fnando/omniauth-wp.svg)](https://codeclimate.com/github/fnando/omniauth-wp)
[![Test Coverage](https://codeclimate.com/github/fnando/omniauth-wp/badges/coverage.svg)](https://codeclimate.com/github/fnando/omniauth-wp/coverage)
[![Gem](https://img.shields.io/gem/v/omniauth-wp.svg)](https://rubygems.org/gems/omniauth-wp)
[![Gem](https://img.shields.io/gem/dt/omniauth-wp.svg)](https://rubygems.org/gems/omniauth-wp)

[Wordpress](https://wordpress.com)'s OAuth2 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-wp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-wp

## Usage

`OmniAuth::Strategies::Wordpress` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: <https://github.com/intridea/omniauth>.

First, create a new application at `https://developer.wordpress.com/apps/`. Your callback URL must be something like `https://example.com/auth/wordpress/callback`. For development you can use `http://127.0.0.1:3000/auth/wordpress/callback`.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`. This example assumes you're exporting your credentials as environment variables.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wordpress,
            ENV['WORDPRESS_CLIENT_ID'],
            ENV['WORDPRESS_CLIENT_SECRET']
end
```

Now visit `/auth/wordpress` to start authentication against Wordpress.

## Contributing

1. Fork [omniauth-wp](https://github.com/fnando/omniauth-wp/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
