class App < Sinatra::Base
  get '/hello' do
    API::V1::HelloWorld.new.to_s
  end
end
