class BoardsController < ApplicationController
  
  before_action :find_board,only: [:edit, :update, :destroy]
  
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    # begin   # 如果成功找到，走這一條
    #   @board = Board.find(params[:id])
    # # @board = Board.find_by(params[:id])
    # # @board = Board.find_by!(params[:id])
    # rescue  # 如果失敗的話畫面不要出錯，就走這一條
    #   redirect_to root_path, notice: '找不到該頁面！'
    # end

    # @posts = Post.where(board: @board)
    # @posts = Post.where(board_id: @board.id)
    # desc: 資料反向
    @posts = @board.posts.order(id: :desc)
  end

  def new 
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to '/', notice: '新增看板成功'
    else
      render :new
    end
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to '/', notice: '編輯看板成功'
    else
      render :edit
    end
  end

  def destroy
    # @board = Board.find(params[:id])

    @board if @board.destroy
    redirect_to '/', notice: '刪除成功'
  end

  private
  def board_params
    params.require(:board).permit(:title)
  end

  def find_board
    @board = Board.find(params[:id])
  end

  def test
  end
end
