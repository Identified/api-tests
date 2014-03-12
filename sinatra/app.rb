# encoding: utf-8
require 'sinatra'

class App < Sinatra::Application
  get "/hello" do
    'world'
  end
  
  post "/v1/json" do
    'world'
  end
  
  post "/v2/json" do
    'world'
  end
end
