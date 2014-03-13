module Apis
  class V1 < Grape::API
    version 'v1', using: :path
    format :json
    
    post :json do
      { str: params[:str].upcase }
    end
  end
end
