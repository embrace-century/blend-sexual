require 'rubygems'
require 'pry'
require 'thwait'

Dir[File.dirname(__FILE__) + "/models/*.rb"].map { |file| require file }
Dir[File.dirname(__FILE__) + "/models/matches/*.rb"].map { |file| require file }
Dir[File.dirname(__FILE__) + "/middlewares/*.rb"].map { |file| require file }

if (ARGV.size != 2)
  puts "参数错误"
  exit
end

Diff.run(ARGV)