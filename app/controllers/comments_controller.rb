class CommentsController < ApplicationController
  def index
    @comments = Comment.where('id > ? AND team_id = ?', params[:after_id].to_i, params[:team_id].to_i).order('created_at DESC')
    puts @comments
    # @comments = Comment.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end

  def new
    @comment = Comment.new
    @comments = Comment.where('team_id = ?', params[:team_id].to_i).order('created_at ASC')
  end

  def create
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)
        
        if @comment.save
          flash.now[:success] = 'Your comment was successfully posted!'
          puts @comment.body
        else
          flash.now[:error] = 'Your comment cannot be saved.'
        end
        # format.html {redirect_to new_comment_path, team_id: params[:team_id]}
        # format.html {redirect_to "/comments/new?team_id=#{params[:team_id]}"}

        puts "this is output"
        puts params
        format.html {redirect_to "/comments/new?team_id=#{params[:team_id]}"}
        format.js
      else
        puts "this is output"
        puts params
        format.html {redirect_to "/comments/new?team_id=#{params[:team_id]}"}
        format.js {render :content_type => 'text/javascript'}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :team_id)
  end
end
