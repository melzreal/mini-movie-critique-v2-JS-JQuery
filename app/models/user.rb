class User < ApplicationRecord

	# has_secure_password
	validates_uniqueness_of :username
	has_many :movies
	has_many :comments
	
#     before_validation :no_password_omniauth




# @called_omniauth = false

#   # Build new omniauth users
#   def apply_omniauth(omniauth)
#     authentications.build(
#     :provider => omniauth['provider'], 
#     :uid => omniauth['uid'])
#     self.first_name = omniauth['user_info']['first_name'] if self.first_name.blank?
#     self.last_name = omniauth['user_info']['last_name'] if self.last_name.blank?
#     self.email = omniauth['user_info']['email'] if omniauth['user_info']['email'] && self.email.blank?
#     @called_omniauth = true
#   end

#   def password_required
#     return false if @called_omniauth == true
#     (authentications.empty? || !password.blank?)
#   end

#   private

#   def no_password_omniauth
#     self.password_digest = 0 unless password_required
#   end



end
