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
    erb :'/tweets/show'
  else 
    redirect to "/login"
  end
  
  post '/tweets' do 
    @tweet = Tweet.create(params[:tweet])
    
    redirect to "/tweets/#{@tweet.id}"
  end
  
  get '/tweets/:id/edit' do
    if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/edit'
  else 
    redirect to "/login"
  end
  
  patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.update(params[:tweet])
    redirect to "/tweets/#{@tweet.id}"
  end
  
  delete '/tweets/:id/delete' do 
     
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.clear
    redirect to "/tweets"
  end
end
