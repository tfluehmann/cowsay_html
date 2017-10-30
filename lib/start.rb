require 'sinatra'
require 'ruby_cowsay'
require 'htmlentities'

set :bind, '0.0.0.0'

get '/' do
  "<pre>#{HTMLEntities.new.encode(Cow.new.say('OMG David!'))}</pre>"
end
