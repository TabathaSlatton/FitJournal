class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    def home
        authenticate_user! 
       @user = current_user 
       @post = Post.new
       @posts = Post.all.sort_by{|post| post.updated_at || post.created_at}.reverse
    end

end
