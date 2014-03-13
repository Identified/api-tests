module V2
  class HelloController < ApplicationController
    respond_to :json

    def lowercase_json
      sleep 50.0/1000.0
      render json: { str: params[:str].downcase } if params[:str]
    end
  end
end