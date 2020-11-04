class RegistrationsController < Devise::RegistrationsController
       
    private

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :username, :profile_img_url, :starting_weight, :current_weight, :long_term_goal, :goal_weight)
    end
    
    def account_update_params
        # binding.pry
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :username, :profile_img_url, :starting_weight, :current_weight, :long_term_goal, :goal_weight)
    end

  
end
    
