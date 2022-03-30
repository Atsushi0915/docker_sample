class SessionsController < ApplicationController

  before_action :authenticate_user, {only:[:destroy]}  #ログインが必要
  before_action :forbid_login_user, {only:[:create]}  #ログアウトが必要

  def new
  end

  def create
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
    if session[:user_id]
      session[:user_id] = nil
      flash.notice = "ログアウトしました"
      redirect_to login_form_path
    end
  end
end
