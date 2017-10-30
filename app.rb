require 'sinatra'
require 'ruby_cowsay'
require 'chucknorris'
require 'htmlentities'

set :bind, '0.0.0.0'

get '/' do
  "<pre>#{HTMLEntities.new.encode(Cow.new.say(ChuckNorris.random))}</pre>"
end
