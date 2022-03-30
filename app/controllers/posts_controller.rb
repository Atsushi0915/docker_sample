class PostsController < ApplicationController

  before_action :authenticate_user, {only:[:new, :create, :update, :destroy, :index, :show, :edit]}  #ログインが必要
  before_action :forbid_login_user, {only:[:new, :create]}  #ログアウトが必要

  def top
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash.notice = "投稿しました"
      redirect_to posts_index_path
    else
      flash.notice = "投稿失敗しました"
      render post_new_path
    end
  end

  def update
    post = Post.find_by(id: params[:id])

    if post.update(post_params)
      flash.notice = "更新しました。"
      redirect_to posts_index_path
    else
      flash.notice = "更新失敗しました"
      redirect_to post_edit_path(post.id)
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    flash.notice = "削除しました"
    redirect_to posts_index_path
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
