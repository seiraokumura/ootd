require 'helpers/session_helpers'

Rspec.configure do |config|
  config.include Freatures::SessionHelpers, type: :feature
end
