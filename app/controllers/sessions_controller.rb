class SessionsController < ApplicationController
  def new
  end

  def create
    p "===================="
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.notice = "ログインしました"
      redirect_to root_path
    else
      flash.notice = "入力内容が間違っています"
      render login_form_path
    end
  end

  def destroy
  end
end
