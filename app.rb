require 'sinatra'
require 'ruby_cowsay'
require 'htmlentities'
require 'json'
require 'net/http'

set :bind, '0.0.0.0'

def random_cow
  cows = Cow.cows
  cows[Random.new.rand(0...cows.count)]
end

def grab_joke
  response = Net::HTTP.get_response("official-joke-api.appspot.com","/random_joke")
  _response = JSON.parse(response.body)
  "#{_response['setup']}\n#{_response['punchline']}"
end

get '/' do
  "<pre>#{HTMLEntities.new.encode(Cow.new(cow: random_cow).say(grab_joke))}</pre>"
end

get '/healthz' do
  "OK"
end

get '/favicon.ico' do
  File.read('./favicon.ico')
end
