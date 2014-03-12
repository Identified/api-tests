# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
Bundler.require
require 'json'
Dir['./spec/support/**/*.rb'].each {|file| require file }
Dir['./apis/**/*.rb'].each {|file| require file }
require './api'

require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
end

def app
  Api
end
