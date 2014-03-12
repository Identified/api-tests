class App < Sinatra::Base
  module JSON_Helpers
    def json_body
      ::MultiJson.load(request.body.read)
    end
  end
end