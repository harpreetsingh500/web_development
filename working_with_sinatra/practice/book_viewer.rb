require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @files = File.readlines("data/toc.txt")  
end

get "/" do
  erb :home
end

get "/:file" do
  file = "chp#{params[:file]}.txt"
  @content = File.readlines("data/#{file}")
  
  erb :read_file
end