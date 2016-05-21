require 'sinatra'
require 'sinatra/reloader'
require "tilt/erubis"

before do
  @files = Dir.glob('public/*/*').map do |file|
    file.gsub("public/images/", '')
  end.sort
end

get "/" do
  @sort = true
  erb :home
end

get "/:file" do
  file = params[:file]
  File.open("public/images/#{file}")
end

get "/sort/:value" do
  value = params[:value]
  value = (value == 'true' ? true : false)
  @files = value ? @files.sort : @files.sort.reverse
  @sort = value
  erb :home
end