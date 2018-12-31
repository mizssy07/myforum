class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update, :show]}

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def delete_post
    @post = Post.find_by(id: params[:id])
    @post.delete_flag = 1
    @post.save
    redirect_to("/users/#{@current_user.id}")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:danger] = "ユーザー登録に失敗しました"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:danger] = "編集に失敗しました"
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/topics/index")
    else
      flash[:danger] = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    reset_session
    flash[:danger] = "ログアウトしました"
    redirect_to("/login")
  end

end
