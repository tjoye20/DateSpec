require 'pry'
class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
    @users = User.where(gender: current_user.gender_seeking)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Signup successful!"
    else
      @errors = @user.errors.full_messages
      redirect_to new_user_path
    end
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :gender,
     :gender_seeking, :bio, :question_1, :question_2, :question_3)
  end
end
