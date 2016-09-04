class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_sessions

  helper_method :current_user, :authenticate_user, :showed_interest(admirer_user_id), :admirers(user)

  private

  def showed_interest(admirer_user_id)
    admirered_user = Admirer.find_by(user_id: admirer_user_id)
    if admirered_user && (admirered_user.admirer_id == current_user.id)
      return true
    else
      return false
    end
  end

  def admirers(user)
    @admirer_users = []
    user.admirers.each do |admirer|
      if admirer.user_approved
        admirer = User.find(admirer.user_id)
        @admirer_users << admirer
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    if !current_user
      redirect_to login_path, notice: "You must be signed in to do that!"
    end
  end

end
