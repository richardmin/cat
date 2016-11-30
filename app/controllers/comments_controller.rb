class CommentsController < ApplicationController
  def index
    # @comments = Comment.where('id > ?', params[:after_id].to_i).where('team_id = ?', params[:team_id].to_i).order('created_at DESC')
    @comments = Comment.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end

  def new
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
  end

  def create
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          flash.now[:success] = 'Your comment was successfully posted!'
        else
          flash.now[:error] = 'Your comment cannot be saved.'
        end
        format.html {redirect_to "/comments/new?team_id=#{params[:comment][:team_id]}"}
        format.js
      else
        format.html {redirect_to "/comments/new?team_id=#{params[:comment][:team_id]}"}
        format.js {render :content_type => 'text/javascript'}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
