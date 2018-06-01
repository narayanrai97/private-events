class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :search]
  
  def index
    @upcoming_events = Event.upcoming_events
  end
  
  def past_events
    @past_events = Event.past_events
  end

  def new
    @event = Event.new
  end
  
  def create
    # @user = current_user
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to current_user
    else
      flash.now[:danger] = "The event could not be saved."
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end
  
  def attend
    @user      = current_user
    @event     = Event.find(params[:id])
    @attendees = @event.attendees.pluck(:attendee_id)
    @attendees << @user.id
    @event.attendee_ids = @attendees.uniq
    flash.now[:success] = "You've signed up for the event"
    redirect_to events_path
  end
  
  def unattend
    @user      = current_user
    @event     = Event.find(params[:id])
    @attendees = @event.attendees
    if @attendees.delete(@user)
      flash.now[:succes] = "You've cancelled your signup for the event"
      redirect_to current_user
    else
      flash.now[:error] = "Cancellation not successful"
      redirect_to current_user
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash.now[:notice] = "Event deleted"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end
  
  def search
    name    = params[:name]
    @events = Event.where('name LIKE ?', "%#{name}%")
  end
  
  private
  
    def event_params
      params.require(:event)
            .permit(:name, :date, :description)
    end
    
    # Confirms a logged_in user.
    def logged_in_user
      unless logged_in?
        flash[:info] = "Please log in!"
        redirect_to login_url
      end
    end
end
