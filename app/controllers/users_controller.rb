class UsersController < ApplicationController
  def new
    # flash[:user] は、validationエラー時も、入力していたテキストを表示させるため
    @user = User.new(flash[:user])
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      # Railsのバージョンアップによって redirect_to :back が廃止された
      # https://qiita.com/100010/items/3ae5dea25e85b0cbf1ee
      # redirect_to :back, flash: {
      #   user: user,
      #   error_messages: user.errors.full_messages
      # }
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: 'http://localhost'
    end
  end

  def me
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
