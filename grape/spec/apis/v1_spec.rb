require 'spec_helper'
describe Apis::V1 do
  include Rack::Test::Methods
  describe '/v1/json' do
    it 'returns {str: TEST}' do
      post '/v1/json.json', str: 'test'
      JSON.parse(last_response.body).should == {'str' => 'TEST'}
    end
  end
end