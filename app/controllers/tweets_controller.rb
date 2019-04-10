class TweetsController < ApplicationController
  get '/tweets/new' do
    if session[:user_id] != nil
      erb :'/tweets/new'
    else
      redirect '/login'
    end
  end

  post '/tweets/new' do
    redirect '/tweets/new' if session[:user_id] != nil
    redirect '/login'
  end

  get '/tweets' do
    #binding.pry
    if session[:user_id] != nil
      @user = current_user
      erb :'/tweets/tweets'
    else
      redirect '/login'
    end
  end

  post '/tweets' do
    @user = User.find(session[:user_id])
    redirect '/tweets/new' if params[:tweet][:content].empty?
    @user.tweets << Tweet.new(params[:tweet])
    redirect "/users/#{@user.slug}"
  end

  get '/tweets/:id/edit' do

  end

  get '/tweets/:id' do
    if session[:user_id] != nil
      @tweet = Tweet.find(params[:user_id])
      erb :'/tweets/show'
    else
      redirect '/login'
    end
  end

  post '/tweets/:id' do

  end

  post '/tweets/:id/delete' do

  end

end
