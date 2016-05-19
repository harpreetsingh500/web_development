require 'sinatra'

get '/' do
  haml '%div.title Hello World'
end

#code to run sinatra
#ruby myapp.rb -p $PORT -o $IP