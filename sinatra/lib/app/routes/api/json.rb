class App < Sinatra::Base
  post '/v1/json' do
    json API::V1::JSON.new(json_body).data
  end
  
  post '/v2/json' do
    json API::V2::JSON.new(json_body).data
  end
end
