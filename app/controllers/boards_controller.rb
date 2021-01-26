class BoardsController < ApplicationController

  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    # kaminariを導入したことにより、モデルにpageメソッドが追加された
    @boards = Board.page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    # flash変数は一度そのキーで参照されたら、そのキーの値はセッションから削除されるという特殊な変数
    flash[:notice] = "「#{board.title}」の掲示板を作成しました。"
    redirect_to board
    # redirect_to action: "index"
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to @board
  end

  def destroy
    @board.delete
    redirect_to boards_path, flash: {notice: "「#{@board.title}」の掲示板が削除されました。"}
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end
