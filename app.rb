require 'sinatra'
require 'ruby_cowsay'
require 'chucknorris'
require 'htmlentities'

set :bind, '0.0.0.0'

def random_cow
  cows = Cow.cows
  cows[Random.new.rand(0...cows.count)]
end

get '/' do
  "<pre>#{HTMLEntities.new.encode(Cow.new(cow: random_cow).say(ChuckNorris.random))}</pre>"
end

get '/favicon.ico' do
  File.read('./favicon.ico')
end
