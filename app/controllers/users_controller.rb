class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
        # binding.pry
        @posts = @user.posts.search(params[:search]).order(:updated_at || :created_at).reverse

        @post = Post.new
    end
end