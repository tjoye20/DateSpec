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
    @user = User.find(params[:user_id])
  end

  def create
    @admirer = Admirer.new(admirer_params)
    @admirer.user_id = params[:user_id]
    @admirer.admirer_id = current_user.id
    if @admirer.save
      redirect_to users_path, notice: "Your response has been submitted and the user has been notified!"
      UserMailer.new_admirer_email(User.find(params[:user_id]).username, User.find(params[:user_id]).email).deliver_now
    else
      @errors = @admirer.errors.full_messages
      render :new
    end
  end

  def show
    @admirer = Admirer.find(params[:id])
    @user = User.find_by(id: params[:user_id])
  end

  def destroy
    @admirer = current_user.admirers.find_by(admirer_id: params[:id])
    if @admirer.admirer_id != current_user.id
      @admirer.user_approved = false
      @admirer.save
      redirect_to user_admirer_path
    else
      flash[:alert] = "You don't have access to make this change."
      redirect_to user_admirer_path
    end
  end

  private
  def admirer_params
    params.require(:admirer).permit(:user_id, :admirer_id, :q1_response, :q2_response, :q3_response)
  end
end
