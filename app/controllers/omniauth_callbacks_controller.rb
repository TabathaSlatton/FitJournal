class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # before_action :authenticate_user!, except: :google
    # skip_before_action :authenticate_user!

 def google_oauth2
    @user = User.google_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
 end

#     def omniauth
#         @user = User.from_omniauth(auth)
#         @user.save
#         # this is redirecting to my root route
#         sign_in_and_redirect @user
#     end

# private
#     def auth
#         request.env['omniauth.auth']
#     end


end
