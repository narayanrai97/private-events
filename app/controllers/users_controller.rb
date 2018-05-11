class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "User created and logged in"
      redirect_to @user
    else
      flash[:danger] = "Please fix the errors shown"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    # @upcoming_events = @user.upcoming_events
    @upcoming_events = @user.events.where('date >= ?', Time.zone.now)
    # @prev_events     = @user.prev_events
    @prev_events     = @user.events.where('date < ?', Time.zone.now) 
    @attended_events = @user.attended_events
  end
  
  
  private
  
    def user_params
      params.require(:user)
            .permit(:name, :email, :password, :password_confirmation)
    end
end
