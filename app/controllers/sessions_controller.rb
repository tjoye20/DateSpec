class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to users_path
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash
      provider_login(auth_hash)
    else
      password_login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

  protected

  def provider_login(auth_hash = {})
    identity = Identity.for_auth(auth_hash)
    if identity.empty?
      session[:auth_hash] = auth_hash
      redirect_to signup_path, :notice => "Github authentication successful, but you must still complete the sign up form."
    else
      session[:user_id] = identity.first.user_id
      redirect_to users_path, :notice => "Logged in!"
    end
  end

  def password_login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Logged in!"
    else
      redirect_to new_session_path, alert: "Invalid email or password."
    end
  end
end
