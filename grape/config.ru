root = ::File.dirname(__FILE__)
require ::File.join( root, 'api' )

app = Api.new

run app
