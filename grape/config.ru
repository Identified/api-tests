root = ::File.dirname(__FILE__)
$:.unshift ::File.join( root, 'lib' )

require 'api'

app = Api.new

run app
