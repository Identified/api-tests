require 'app/helpers/json_helpers'

class App < Sinatra::Base  
  helpers Sinatra::JSON
  helpers JSON_Helpers
end