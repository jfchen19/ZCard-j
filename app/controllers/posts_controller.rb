class PostsController < ApplicationController
  before_action :session_required, only: [:create]
  before_action :set_board, only: [:new, :create]

  def new
    @post = Post.new
    # @board = Board.find(params:[:board_id])
  end

  def create
    # @board = Board.find(params:[:board_id])
    @post = Post.new(post_params)
    @post.board = @board
    @post.user = current_user

    if @post.save
      redirect_to root_path, notice: '新增文章成功'
    else
      render :new
    end
  end

  private
  def set_board
    @board = Board.find(params:[:board_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end