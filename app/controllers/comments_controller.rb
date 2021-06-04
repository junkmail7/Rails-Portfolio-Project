class CommentsController < ApplicationController
    def create
        comment = Comment.new
        comment.user_id = current_user.id
        comment.spot_id = params[:spot_id]
        comment.comment_text = params[:comment_text]
        comment.save
        redirect_to spot_path(comment.spot)
    end
end