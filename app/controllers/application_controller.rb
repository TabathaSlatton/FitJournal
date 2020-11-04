class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    def home
        authenticate_user!
       @user = current_user 
    end

# protected
#   def authenticate_user!
#     if user_signed_in?
#       super
#     else
#       redirect_to new_user_session_path, :alert => 'Must be logged in to view this page'
#     end
#   end

end
