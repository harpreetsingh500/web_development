require 'yaml'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @user_hash = YAML.load_file("data/users.yaml")
end

get '/' do
  redirect '/user-names'
  erb :home
end

get '/user-names' do
  @names = @user_hash.keys

  erb :user_names
end

get '/user/:name' do
  @name = params[:name].to_sym
  @email = @user_hash[@name][:email]
  @interests = @user_hash[@name][:interests].join(', ')
  @other_users = @user_hash.keys - [@name]
  
  erb :user
end

helpers do
  def count_users
    @user_hash.size
  end
  
  def count_interests
    count = 0
    @user_hash.each_key do |name|
      count += @user_hash[name][:interests].size
    end
    count
  end
end
