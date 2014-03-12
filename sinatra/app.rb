# encoding: utf-8
require 'sinatra'

class App < Sinatra::Application
  get "/hello" do
    'world'
  end
end
