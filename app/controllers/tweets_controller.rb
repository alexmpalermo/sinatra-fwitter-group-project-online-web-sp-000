class TweetsController < ApplicationController

  get '/tweets' do 
    if logged_in?
    @tweets = Tweet.all
    erb :'/tweets/index'
  else 
    redirect to "/login"
  end 
  end 
  
  get '/tweets/new' do 
    if logged_in?
    erb :'/tweets/new'
  else 
    redirect to "/login"
  end 
end 
  
  get '/tweets/:id' do 
    if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/show_tweet'
  else 
    redirect to "/login"
  end
end 
  
  post '/tweets' do 
    if params[:content] != ""
    @tweet = Tweet.create(content: params[:content])
    @tweet.user = current_user
    redirect to "/tweets/#{@tweet.id}"
  else 
    redirect to "/tweets/new"
  end
end 
  
  get '/tweets/:id/edit' do
    if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/edit_tweet'
  else 
    redirect to "/login"
  end
end 
  
  patch '/tweets/:id' do
    if params[:content] != ""
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.update(content: params[:content])
    redirect to "/tweets/#{@tweet.id}"
  else 
    redirect to "/tweets/#{@tweet.id}/edit"
  end
end 
  
  delete '/tweets/:id/delete' do 
     
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.clear
    redirect to "/tweets"
  end
end
