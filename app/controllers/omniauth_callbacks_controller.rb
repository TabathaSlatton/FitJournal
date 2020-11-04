class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :authenticate_user!, except: :google_oauth2
    # skip_before_action :authenticate_user!

    def google_oauth2
        @user = User.google_omniauth(request.env['omniauth.auth'])
        sign_in_and_redirect @user
    end

end
