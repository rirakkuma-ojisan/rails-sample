class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    # sessionにuser_idの情報が無ければreturnする
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
end
