class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to users_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Logged in!"
    else
      redirect_to new_session_path, alert: "Invalid email or password." 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
