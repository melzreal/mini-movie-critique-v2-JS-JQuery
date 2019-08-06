class UsersController < ApplicationController

    
	def new
	 @user = User.new
	end

	def create

	 @user = User.new(user_params)

		if @user.save
		  session[:user_id] = @user.id
		  redirect_to user_path(@user.id)
		else	
		  render template: 'users/new' 
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
        params.require(:user).permit(:name, :username, :password, :email, :image, :uid)
    end

end
