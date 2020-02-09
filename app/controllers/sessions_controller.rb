class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(email: oauth_email)
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.new(email: oauth_email, password: SecureRandom.hex)
        if user.save 
        session[:user_id] = user.id
        redirect_to root_path
        else
          render :new
        end
      end
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else 
        render 'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def login_and_redirect_to_root
    session[:user_id] = user.id
    redirect_to root_path
  end
end
