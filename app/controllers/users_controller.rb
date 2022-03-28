class UsersController < ApplicationController

  before_action :authenticate_user, {only:[:index, :show, :edit]}  #ログインが必要
  before_action :forbid_login_user, {only:[:new, :create]}  #ログアウトが必要

  def index
    @user = User.all
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to('/users/index')
      flash.notice = "新規会員登録しました。"
    else
      render('users/new')
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      
    end
end
