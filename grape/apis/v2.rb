module Apis
  class V2 < Grape::API
    version 'v2', using: :path
    format :json

    post :json do
      { string: params[:string].upcase }
    end
  end
end
