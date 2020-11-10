class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    # around_action :switch_time_zone, :if => :current_user

    # def switch_time_zone(&block)
    #     Time.use_zone(current_user.time_zone, &block)
    # end
    def home
        authenticate_user! 
       @user = current_user 
       @post = Post.new
       @posts = Post.search(params[:search]).order(:updated_at || :created_at).reverse
    end

end
