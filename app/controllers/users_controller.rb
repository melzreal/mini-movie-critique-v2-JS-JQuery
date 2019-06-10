class UsersController < ApplicationController

    
	def new
	 @user = User.new
	end

	def create
	 @user = User.create(user_params)

		if @user
		  session[:user_id] = @user.id
		  redirect_to user_path(@user)
		else
		  redirect_to new_user_path
		end

	end

	def self.from_omniauth(auth)
	    # Creates a new user only if it doesn't exist
	    where(email: auth.info.email).first_or_initialize do |user|
	      user.name = auth.info.name
	      user.username = auth.info.email
	    end
	  end


	def show
	 if logged_in?
		@user = current_user
	 else
		redirect_to root_url
	 end
	end



    private

    def user_params
        params.permit(:username, :name, :password, :google_token, :google_refresh_token)
    end

end
