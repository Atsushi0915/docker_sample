module SessionsHelper

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def authenticate_user
    if @current_user == nil
      flash.notice = "ログインが必要です"
      redirect_to login_form_path
    end
  end

  def forbid_login_user
    if @current_user
      flash.notice = "すでににログインしています。"
      redirect_to root_path
    end
  end

end
