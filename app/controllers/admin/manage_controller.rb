class Admin::ManageController < ActionController::Base
  
  def index
 	@users = User.all
 	render template: 'admin/index' 
  end

end