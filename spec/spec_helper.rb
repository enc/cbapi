$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'rspec'
require 'cbapi'
require 'json'
