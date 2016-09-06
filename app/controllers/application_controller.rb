class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_sessions

  helper_method :users_approved_to_message, :current_user, :authenticate_user, :showed_interest, :their_admirers,
                :their_conversations

  private

  def showed_interest(admirer_user_id)
    admirered_user = Admirer.find_by(user_id: admirer_user_id)
    if admirered_user && (admirered_user.admirer_id == current_user.id)
      return true
    else
      return false
    end
  end

  def users_approved_to_message
    users = []
    their_timeline.each do |user|
      if (Admirer.find_by(user_id: current_user.id, admirer_id: user.id)) && (Admirer.find_by(user_id: user.id, admirer_id: current_user.id))
        users << user
      end
    end
    return users
  end

  def their_timeline
    array_of_users = []
    users = User.where.not(id: current_user.id)
    users = users.where(gender: current_user.gender_seeking)
  end

  def their_admirers
    array_of_admirers = []
    all = Admirer.where(user_id: current_user.id)
    all.each do |admirers|
      if admirers.user_approved
        array_of_admirers << admirers
      end
    end
    return array_of_admirers
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
