# CommentsController is super class in here
class CommentsController < ApplicationController

    def index
        @comments = @commentable.comments
        render json: @comments
    end

    def create
        @comment = @commentable.comments.new comment_params
        @commentable.save
        render json: @comment
    end


private
    def comment_params
        params.require(:comment).permit(:content, :user_id)
    end
end
