class BoardsController < ApplicationController

  rescue_from(ActiveRecord::RecordNotFound, { with: :hi })
  #當目前所在controller只要出現 ActiveRecord::RecordNotFound 的錯誤訊息，就使用後面的方法來解決
  # （大括號與小括號可省略）

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
  def hi   # rescue_from
    render file: 'public/404.html', 
           layout: false,  # 取消所有layout，套用404.html自己的css
           status: 404     # 另外將網頁狀態改為404
  end

  def board_params
    params.require(:board).permit(:title)
  end

  def find_board
    @board = Board.find(params[:id])
  end
end
