require 'sinatra'
require './bowling'

get '/' do
  bowling = Bowling.new
  bowling.hit(1234)
  "Hello World, #{bowling.score}!"
end
