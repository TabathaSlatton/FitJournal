class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    def home
        authenticate_user! 
       @user = current_user 
       @post = Post.new
       @posts = Post.all
    end

end
