class SessionsController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end


  def create

    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def create_facebook
  
  user = User.from_facebook
   @user = User.find_or_create_by(username: auth['info']['email']) do |u|
      u.name = auth['info']['name']
    end

    session[:user_id] = @user.id
 
    render 'users/index'
  end 


  def create_google
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    log_in(user)
    user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token

    user.google_refresh_token = refresh_token if refresh_token.present?

    user.save
    redirect_to root_path

  end 


  def destroy
    session.destroy
    redirect_to root_path
  end

  private
   
    def auth
      request.env['omniauth.auth']
    end


  end
