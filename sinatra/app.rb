# encoding: utf-8
require 'sinatra/base'
require 'sinatra/json'
if RUBY_PLATFORM != 'java'
  require 'yajl'
end

class App < Sinatra::Base
  helpers Sinatra::JSON
  
  get "/hello" do
    'hello world'
  end
  
  post "/v1/json" do
    json hello: 'world'
  end
  
  post "/v2/json" do
    json hello: 'world'
  end
end
