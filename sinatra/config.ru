root = ::File.dirname(__FILE__)
$:.unshift ::File.join( root, 'lib' )

require 'app'

run App.new