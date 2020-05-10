require 'sinatra/base'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/home' do
    session[:username] = User.create(email: params[:email], username: params[:username])
    redirect '/home'
  end

  get '/home' do
    user = session[:username]
    User.current_user?(user.username)
    @username = user.username
    @peep = session[:peep]
    erb :home
  end

  get '/home/new' do
    erb :new
  end

  post '/home/new' do
    session[:peep] = params[:peep]
    redirect '/home'
  end

  run! if app_file == $0
end
