Dir["./lib/util/*.rb"].each {|file| require file }
require 'minitest/reporters'
require 'minitest/autorun'
require 'awesome_print'
include Util

Minitest::Reporters.use!
