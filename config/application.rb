require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Petshop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    #I18N
    config.i18n.default_locale = :pt_BR

    #Rspec configuration ( torna o rspec o arquivo de teste padrão)
    config.generators do |g|
    	g.test_framework :rspec, :view_specs => false,
    							 :controller_specs => false,
    							 :helper_specs => false,
    							 :routing_specs => false,
    							 :request_specs => false
    end

  end
end
