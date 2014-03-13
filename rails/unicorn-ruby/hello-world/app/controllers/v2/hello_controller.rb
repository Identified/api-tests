module V2
  class HelloController < ApplicationController
    respond_to :json

    def lowercase_json
      puts params
      render json: { str: params[:str].downcase } if params[:str]
    end
  end
end