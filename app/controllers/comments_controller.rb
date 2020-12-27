class CommentsController < ApplicationController
  before_action :session_required
  before_action :find_post, only: [:create]

  def create
    # @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
  
    if @comment.save
      redirect_to @post, notice: '留言新增成功'
    else
      render 'post/show', notcie: '留言新增失敗'
    end
  end

  def destroy
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end