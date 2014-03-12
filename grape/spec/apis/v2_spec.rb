require 'spec_helper'
describe Apis::V2 do
  include Rack::Test::Methods
  describe '/v2/json' do
    it 'returns {string: TEST}' do
      post '/v2/json.json', string: 'test'
      JSON.parse(last_response.body).should == {'string' => 'TEST'}
    end
  end
end
