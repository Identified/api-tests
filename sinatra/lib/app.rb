# encoding: utf-8
require 'sinatra/base'
require 'sinatra/json'

if RUBY_PLATFORM != 'java'
  require 'yajl'
end

puts MultiJson.engine

class App < Sinatra::Base
end


require 'app/helpers/init'
require 'app/controllers/init'
require 'app/routes/init'

