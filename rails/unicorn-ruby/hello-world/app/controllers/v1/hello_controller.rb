module V1
  class HelloController < ApplicationController
    respond_to :json

    def upcase_json
      render json: { str: params[:str].upcase } if params[:str]
    end
  end
end