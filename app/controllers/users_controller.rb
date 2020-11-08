class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
        @posts = @user.posts.sort_by{|post| post.updated_at || post.created_at}.reverse
        @post = Post.new
    end
end