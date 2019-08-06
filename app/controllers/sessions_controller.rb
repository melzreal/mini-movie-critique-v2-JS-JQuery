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
      redirect_to user_path(current_user)
    else
      redirect_to new_user_path
    end
  end

  def create_facebook 
    info = auth;
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex(9)
    end

    session[:user_id] = @user.id

    render 'users/facebook'
  end 

  def create_git
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
