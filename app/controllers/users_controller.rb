class UsersController < ApplicationController
  
  get '/signup' do 
    if logged_in?
      @user = current_user
      redirect to "/tweets"
    else 
      erb :'/users/create_user'
  end 
  end
  
  get '/login' do 
     if logged_in?
      redirect to "/tweets"
      else 
     erb :'/users/login'
  end
end 
  
  get '/user/:slug' do
    
    @user = User.find_by_slug(params[:slug])
     
    @user = current_user
    erb :'/users/show'
  else
    redirect to "/login"
  end
  end
  
  post '/signup' do
    if params[:username] != "" &&  params[:password] != "" && params[:email] != ""
    @user = User.create(username: params[:username], password: params[:password], email: params[:email])
    session[:user_id] = @user.id 
    redirect to "/tweets"
  else 
    redirect to "/signup"
  end
  end
  
  post '/login' do 
    if params[:username] != "" &&  params[:password] != "" 
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/user/#{@user.slug}"
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end
  
  get '/logout' do
    if !logged_in?
      redirect to "/login"
    else 
    session.clear
    redirect to "/login"
  end 
  end
end