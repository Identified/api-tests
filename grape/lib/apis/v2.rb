module Apis
  class V2 < Grape::API
    version 'v2', using: :path
    format :json

    post :json do
      sleep 50.0/1000.0
      { string: params[:string].upcase }
    end
  end
end
