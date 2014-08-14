class CommentsController < ApplicationController
  respond_to :json

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable = commentable
    @comment.user = current_user
    if @comment.save
      @comment.commentable.user.notify(
        "was commented on",
        "was commented on",
        @comment
      )
    end
    respond_with(@comment)
    #"Your #{commentable_type}

  end

  private

  def commentable
    commentable_type.camelize.constantize.find(commentable_id)
  end


  def commentable_type
    %w(comment image).detect{ |type| params["#{type}_id"].present? }
  end


  def commentable_id
    params["#{commentable_type}_id"]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
