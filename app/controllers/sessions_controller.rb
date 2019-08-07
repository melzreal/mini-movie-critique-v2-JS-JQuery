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



  def destroy
    session.destroy
    redirect_to root_path
  end

  private
   
    def auth
      request.env['omniauth.auth']
    end


  end
