require 'pry'
class AdmirersController < ApplicationController

  def index
    if current_user && their_admirers.length > 0
      @admirers = their_admirers
    else
      flash[:notice] = "You currently have no admirers. Check back soon!"
      redirect_to users_path
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @admirer = Admirer.new(admirer_params)
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
    @admirer = Admirer.find(params[:id])
    @user = User.find_by(id: params[:user_id])
  end

  def destroy
    @admirer = Admirer.find(params[:id])
    if params[:user_id] == @admirer.user_id
      @admirer.user_approved = false
      redirect_to user_admirer_path
    else
      flash[:alert] = "You don't have access to make this change."
      redirect_to user_admirer_path
    end
  end

  private
  def admirer_params
    params.require(:admirer).permit(:username, :email, :password_digest, :gender,
     :gender_seeking, :bio, :question_1, :question_2, :question_3)
  end
end
