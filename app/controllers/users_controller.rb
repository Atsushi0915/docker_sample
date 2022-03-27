class UsersController < ApplicationController
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
