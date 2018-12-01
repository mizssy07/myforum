class ApplicationController < ActionController::Base
  before_action :set_current_user
  add_flash_types :success, :info, :warning, :danger

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:danger] = "ログインしてください"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:danger] = "すでにログインしています"
      redirect_to("/topics/index")
    end
  end
end
