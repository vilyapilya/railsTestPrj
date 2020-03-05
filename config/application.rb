require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    options = {
        :hostname => 'rubyTestHost',
        :ip =>  '75.10.4.81',
        :mac => '00:00:00:a1:2b:cc',
        :app => 'rubyApplication',
        :env => "PRODUCTION",
        :endpoint => "https://logs.logdna.com/logs/ingest",
        :flush_interval => 1,
        :flush_size => 5,
        :retry_timeout => 60
    }
    config.logger = Logdna::Ruby.new("73523d0836905067b4940f4a718940f9", options)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
