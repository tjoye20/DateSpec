require 'pry'
class AdmirersController < ApplicationController

  def index
    if current_user && admirers(@user).length > 0
      @user = User.find_by(id: current_user.id)
    else
      flash[:notice] = "You currently have no admirers. Check back soon!"
      redirect back
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @admirer = Admirer.new(params[:admirer])
    @admirer.user_id = params[:user_id]
    @admirer.admirer_id = current_user.id
    if @admirer.save
      redirect_to admirer_users_path, notice: "Your response has been submitted!"
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @admirer = Admirer.find_by(admirer_id: params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def destroy
    if current_user == @admirer.user_id
      @admirer = Admirer.find(params[:admirer_id])
      @admirer.user_approved = false
      redirect_to admirer_users_path
    else
      flash[:alert] = "You don't have access to make this change."
      redirect back
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :gender,
     :gender_seeking, :bio, :question_1, :question_2, :question_3)
  end
end
