class BoardsController < ApplicationController

  before_action :find_board,only: [:edit, :update, :destroy]
  
  def index
    @boards = Board.all
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
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to '/', notice: '編輯看板成功'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])

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
end
