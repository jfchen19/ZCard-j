class PostsController < ApplicationController
  before_action :session_required, only: [:create, :edit, :update]
  before_action :set_board, only: [:new, :create]
  before_action :set_post, only: [:show]

  def new
    @post = Post.new
    # @board = Board.find(params[:board_id])
  end

  def create
    # @board = Board.find(params[:board_id])

    # 較原始的寫法
    # @post = Post.new(post_params)
    # @post.board = @board
    # @post.user = current_user
    # user has many posts, 以使用者角度新增文章
    @post = current_user.posts.new(post_params)
    @post.board = @board
    # board has many posts, 以看板角度新增文章
    # @post = @baord.posts.new(post_params)
    # @post.user = current_user

    if @post.save
      redirect_to board_path(@board), notice: '新增文章成功'
    else
      render :new
    end
  end

  def show
    # @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(id: :desc)  # 特定的某一篇post會有許多comments，並且順序顛倒（新的在上舊的在下）
  end

  def edit
    # @post = Post.find_by!(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      rander :edit
    end
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end