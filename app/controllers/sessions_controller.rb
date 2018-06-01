class SessionsController < ApplicationController
  def new
  end
  
  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url, notice: "Signed in!"
  # end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
  # def destroy
  #   log_out
  #   redirect_to root_url
  # end
end
