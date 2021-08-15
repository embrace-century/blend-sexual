require 'rubygems'
require 'pry'

Dir["#{File.dirname(__FILE__)}/models/canary/*.rb"].map { |file| require file }
Dir["#{File.dirname(__FILE__)}/models/production/*.rb"].map { |file| require file }
Dir["#{File.dirname(__FILE__)}/services/*.rb"].map { |file| require file }

binding.pry