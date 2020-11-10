class CommentsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :new, :create]
    before_action :set_comment, only: [:edit, :update, :destroy]


    def new
        @comment = @post.comments.build
    end

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_path
        else
            redirect_to root_path, notice: "Comment not created"
        end
    end

    def edit
      # comment.user_id = current_user.id
        if !@comment
            redirect_to root_path, notice: "Comment not found"
        end
    end

      def update
        if @comment
          @comment.update(comment_params)
          if @comment.errors.any?
            render "edit"
          else
            redirect_to root_path
          end
        else
          render "edit"
        end
      end
  
      def destroy
        @comment.destroy
        redirect_to root_path
      end
  

    private
    def set_post
        @post = Post.find_by_id(params[:post_id])
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
