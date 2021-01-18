require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
Dir["./lib/*"].each { |file| require file }
Dir["./test/*"].each { |file| require file }
# require './test/cipher_test.rb'
# require './test/enigma_test.rb'
