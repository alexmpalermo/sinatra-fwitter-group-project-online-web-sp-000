class TweetsController < ApplicationController

  get '/tweets' do 
    @tweets = Tweet.all
    erb :'/tweets/index'
  end 
  
  get '/tweets/new' do 
    erb :'/tweets/new'
  end 
  
  get '/tweets/:id' do 
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/show'
  end
  
  post '/tweets' do 
    @tweet = Tweet.create(params[:tweet])
    
    redirect to "/tweets/#{@tweet.id}"
  end
  
  get '/tweets/:id/edit' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/edit'
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
