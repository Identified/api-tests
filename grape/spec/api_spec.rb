require 'spec_helper'
describe Api do
  include Rack::Test::Methods
  describe '/hello' do
    it 'returns "hello world"' do
      get '/hello'
      last_response.status.should == 200
      last_response.body.should == 'hello world'
    end
  end
end