class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    @users = their_timeline
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
      redirect_to new_user_path, notice: "You must be a registered user to do that."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @user.update_attributes(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.active = false
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :gender,
     :gender_seeking, :bio, :question_1, :question_2, :question_3)
  end

end
