# encoding: utf-8
Bundler.require
require 'yajl'
require_relative 'apis/v1'
require_relative 'apis/v2'

class Api < Grape::API
  get :hello do
    'hello world'
  end

  mount Apis::V1
  mount Apis::V2
end
