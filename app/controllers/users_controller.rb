class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user,only: [:edit]

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def index
   @book = Book.new
   @users = User.all
   @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(current_user)
    else
      @books = Book.all
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

end
