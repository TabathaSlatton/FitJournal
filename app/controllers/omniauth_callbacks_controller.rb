class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :authenticate_user!, except: :google_oauth2
    # skip_before_action :authenticate_user!

  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"]).first_or_initialize(email: auth["info"]["email"])
        user.username = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.profile_img_url = auth.info.image
        user.email = auth.info.email
        user.save

    user.remember_me = true
    sign_in(:user, user)

    redirect_to after_sign_in_path_for(user)
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
