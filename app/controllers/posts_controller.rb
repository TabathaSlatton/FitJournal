class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to daily_journals_path
        else
            render :new
        end
    end

    def edit
        if !@post
            redirect_to root_route
        end
    end

      def update
        if @post
          @post.update(post_params)
          if @post.errors.any?
            render "edit"
          else
            redirect_to root_route
          end
        else
          render "edit"
        end
      end
  
      def destroy
        @post.destroy
        redirect_to "application#home"
      end
  

    private
    def set_post
        @post = Post.find_by_id(params[:id])
    end

    def post_params
        params.require(:post).permit(:content, :theme)
    end

end
