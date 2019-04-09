class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    #binding.pry
    redirect '/signup' if params[:username].empty? || params[:email].empty? || params[:password].empty?
    binding.pry
    @user = User.new(params)
    session[:user_id] = @user.id
    redirect '/tweets'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do

  end

  get '/users/logout' do

  end
end
